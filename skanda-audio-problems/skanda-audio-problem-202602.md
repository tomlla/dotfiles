# skanda 音声問題調査 (2026-02)

## 症状

- 頻繁に音が出なくなる（muteされたような状態）
- 特定の条件（時間経過、アプリケーション切替）で発生
- `skanda-reset-pa-profile.sh` でカードプロファイルを切り替えると復帰する

## マシン情報

- Host: skanda
- OS: ArchLinux (kernel 6.18.9-arch1-2)
- WM: labwc (Wayland)

## 調査結果: 音声スタックの現状

### ハードウェア / ALSA

Card 0: `HD-Audio Generic` (Radeon, vendor AMD/ATI 1002:1640)
- HDMI出力 x3（全て not available）
- ドライバ: `snd_hda_intel`
- Active Profile: HiFi（ただし全ポート not available なので実質未使用）

Card 1: `HD-Audio Generic` (Ryzen HD Audio, vendor AMD 1022:15e3, Conexant CX11880)
- Speaker, Headphones, Mic1 (Digital), Mic2 (Stereo)
- ドライバ: `snd_hda_intel`
- **Active Profile: `HiFi (Headphones, Mic1, Mic2)` だが Headphones port は `not available`**
  → ヘッドフォン未接続なのにHeadphonesプロファイルになっている = Speaker出力経路がない

### サウンドサーバー: PipeWire と PulseAudio が共存（競合状態）

`pactl info` の結果:
```
Server Name: pulseaudio
Server Version: 17.0-98-gb096
```

`systemctl --user status` の結果:
```
pipewire.service   → active (running), PID 2018
wireplumber.service → active (running), PID 2019
```

**PulseAudio本体がサウンドサーバーとして動作しつつ、PipeWire+WirePlumberも同時に起動している。**

### WirePlumber のエラーログ

```
wp-device: SPA handle 'api.alsa.acp.device' could not be loaded; is it installed?
s-monitors: Failed to create 'api.alsa.acp.device' device
```

PulseAudioがALSAデバイスを先に掴んでいるため、WirePlumber側がデバイスを確保できていない。

### インストール済みパッケージ

PipeWire側:
- pipewire 1:1.4.10-2
- pipewire-audio 1:1.4.10-2
- libpipewire 1:1.4.10-2
- wireplumber 0.5.13-1
- libwireplumber 0.5.13-1

PulseAudio側:
- pulseaudio 17.0+r98+gb096704c0-1
- libpulse 17.0+r98+gb096704c0-1
- pulseaudio-alsa 1:1.2.12-5
- pulseaudio-bluetooth 17.0+r98+gb096704c0-1
- pulseaudio-ctl 1.70-2
- pulseaudio-equalizer 17.0+r98+gb096704c0-1
- pulseaudio-jack 17.0+r98+gb096704c0-1
- pulseaudio-lirc 17.0+r98+gb096704c0-1
- pulseaudio-rtp 17.0+r98+gb096704c0-1
- pulseaudio-zeroconf 17.0+r98+gb096704c0-1

ALSA:
- alsa-card-profiles 1:1.4.10-2
- alsa-lib 1.2.15.3-2
- alsa-plugins 1:1.2.12-5
- alsa-topology-conf 1.2.5.1-4
- alsa-ucm-conf 1.2.15.3-1
- alsa-utils 1.2.15.2-1

## 音声スタック図（現状: 壊れた状態）

```
アプリケーション (Firefox, VLC, etc.)
       ↓
PulseAudio daemon ←──競合──→ PipeWire + WirePlumber
       ↓                          ↓ (デバイス取得失敗)
module-alsa-card                   ✗
       ↓
ALSA (snd_hda_intel)
       ↓
HW: Conexant CX11880 (Card 1, Ryzen HD Audio)
```

## 問題の原因（可能性順）

### 1. PipeWire と PulseAudio の共存競合（最有力）

2つのサウンドサーバーが同じALSAデバイスを奪い合っている。
アプリ切替やタイミングによって制御権が移り、音が出なくなる。

### 2. カードプロファイルの誤選択

Headphones port が not available なのに `HiFi (Headphones, Mic1, Mic2)` プロファイルがアクティブ。
Speaker出力がないプロファイルになっているため音が出ない。
PulseAudioの `module-switch-on-port-available` がPipeWireとの競合で誤動作している可能性。

### 3. module-role-cork による一時ミュート残留

PulseAudioの `module-role-cork` が通話アプリ等のために他streamをcorkし、
アプリが正しく終了しないとcork状態が解除されない。

### 4. module-stream-restore によるmute状態の永続化

アプリごとのvolume/mute状態がDBに保存され、
一度muteされると再起動してもmuteのまま復帰する。

## 方針: PipeWire + WirePlumber に統一する

### PipeWire vs PulseAudio どちらに統一すべきか

**PipeWire に統一する（推奨）。**

理由:
- ArchLinuxは2022年頃からPipeWireをデフォルト推奨に移行している
- `pipewire` パッケージは `xdg-desktop-portal` 等の依存先になっており、削除すると別の問題が起きる
- WirePlumberのデバイスルーティングはPulseAudioより賢く、プロファイル自動切替が改善される
- Wayland環境（labwc）ではPipeWireがスクリーン共有等にも必要
- Bluetoothオーディオのコーデックサポートが良い
- `pipewire-pulse` が PulseAudio互換レイヤーを提供するので、`pactl` 等の既存ツールはそのまま使える

PulseAudioに統一する案は、`pipewire` を消すと依存関係で問題が出る可能性が高く非推奨。

## TODO

### 実施手順

```bash
# 1. PulseAudio関連パッケージを削除（依存関係で消えないものを先に消す）
sudo pacman -Rdd pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pulseaudio-lirc pulseaudio-rtp pulseaudio-zeroconf

# 2. pipewire-pulse をインストール（pulseaudio本体と自動でconflict→置換される）
sudo pacman -S pipewire-pulse

# 3. サービス再起動
systemctl --user restart pipewire wireplumber

# 4. 確認
pactl info | grep "Server Name"
# → "Server Name: PulseAudio (on PipeWire ...)" と表示されればOK

wpctl status
# → Sinks に Ryzen HD Audio が表示され、vol が見えればOK
```

### 実施後の確認事項

- [ ] `pactl info` で Server Name が PipeWire ベースになっていること
- [ ] `wpctl status` でデバイスが正しく認識されていること
- [ ] WirePlumber のログに `api.alsa.acp.device` エラーが出ないこと
- [ ] Speaker プロファイルが自動選択されること
- [ ] アプリ切替後も音が出続けること
- [ ] Bluetooth ヘッドフォン等が必要なら `pipewire-codec-aac` 等を追加インストール

### プロファイル問題が残る場合

WirePlumber のルールでデフォルトプロファイルを固定できる:

```
# ~/.config/wireplumber/wireplumber.conf.d/50-default-profile.conf
monitor.alsa.rules = [
  {
    matches = [
      { device.name = "alsa_card.pci-0000_04_00.6" }
    ]
    actions = {
      update-props = {
        device.profile = "HiFi (Mic1, Mic2, Speaker)"
      }
    }
  }
]
```
