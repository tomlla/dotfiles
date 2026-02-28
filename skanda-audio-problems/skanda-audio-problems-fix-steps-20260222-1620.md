# PipeWire統一マイグレーション手順 (2026-02-22 16:20)

## Phase 1: 現状記録（ロールバック用）

```bash
pacman -Qe | grep -E 'pulse|pipewire|wire' > ./skanda-audio-problems/01-packages-before.txt
systemctl --user list-units --type=service | grep -E 'pulse|pipewire|wire' > ./skanda-audio-problems/02-services-before.txt
pactl info > ./skanda-audio-problems/03-pactl-info-before.txt
pactl list sinks short > ./skanda-audio-problems/04-sinks-before.txt
pactl list cards short > ./skanda-audio-problems/05-cards-before.txt
```

## Phase 2: PulseAudio削除 + pipewire-pulse導入

```bash
# PulseAudioの追加モジュールを先に消す
sudo pacman -Rdd pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pulseaudio-lirc pulseaudio-rtp pulseaudio-zeroconf pulseaudio-ctl

# pipewire-pulse をインストール（pulseaudio本体と自動conflict→置換）
sudo pacman -S pipewire-pulse
```

## Phase 3: サービス切替

```bash
systemctl --user stop pulseaudio.service pulseaudio.socket 2>/dev/null
systemctl --user disable pulseaudio.service pulseaudio.socket 2>/dev/null
systemctl --user restart pipewire pipewire-pulse wireplumber
```

## Phase 4: 動作確認

```bash
pactl info | grep "Server Name" | tee ./skanda-audio-problems/06-server-name-after.txt
# 期待: "PulseAudio (on PipeWire ...)"

wpctl status | tee ./skanda-audio-problems/07-wpctl-status-after.txt
# 期待: Sinks に Ryzen HD Audio が表示

journalctl --user -u wireplumber -b --no-pager | grep -i error | tee ./skanda-audio-problems/08-wireplumber-errors-after.txt
# 期待: api.alsa.acp.device エラーが出ない

pactl list cards | grep -A2 "Active Profile" | tee ./skanda-audio-problems/09-active-profile-after.txt
# 期待: Speaker を含むプロファイルがactive

speaker-test -t wav -c 2 -l 1
# 期待: 左右スピーカーから音声が聞こえる

pgrep -a pulseaudio | tee ./skanda-audio-problems/10-pulseaudio-process-after.txt
# 期待: 何も出ない

pacman -Qe | grep -E 'pulse|pipewire|wire' > ./skanda-audio-problems/11-packages-after.txt
```

## Phase 5: プロファイル問題が残る場合

```bash
mkdir -p ~/.config/wireplumber/wireplumber.conf.d

# device.name は wpctl status の出力から確認して置換
cat > ~/.config/wireplumber/wireplumber.conf.d/50-default-profile.conf << 'EOF'
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
EOF

systemctl --user restart wireplumber
```
