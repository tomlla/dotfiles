DOTFILE=/home/nt/dotfiles
DIST_SYSTEMD_DIR=/etc/systemd/system

.DEFAULT_GOAL := all

.PHONY: all
all: xset-key-repeat.service xset-key-repeat.timer

.PHONY: xset-key-repeat.service
xset-key-repeat.service:
	sudo ln -sf $(DOTFILE)/xset-key-r.systemd/xset-key-repeat.service $(DIST_SYSTEMD_DIR)/xset-key-repeat.service

.PHONY: xset-key-repeat.timer
xset-key-repeat.timer:
	sudo ln -sf $(DOTFILE)/xset-key-r.systemd/xset-key-repeat.timer $(DIST_SYSTEMD_DIR)/xset-key-repeat.timer

