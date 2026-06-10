#!/usr/bin/env bash
set -e

sudo mkdir -p /run/systemd/system/nix-daemon.service.d/
sudo tee /run/systemd/system/nix-daemon.service.d/override.conf <<EOF
[Service]
Environment="https_proxy=socks5h://127.0.0.1:1080"
EOF
sudo systemctl daemon-reload
sudo systemctl restart nix-daemon
