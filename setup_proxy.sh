#!/usr/bin/env bash
set -e

sudo mkdir -p /run/systemd/system/nix-daemon.service.d/
cat << EOF >/run/systemd/system/nix-daemon.service.d/override.conf  
[Service]
Environment="http_proxy=socks5h://localhost:1080"
Environment="https_proxy=socks5h://localhost:1080"
Environment="all_proxy=socks5h://localhost:1080"
EOF

sudo systemctl daemon-reload
sudo systemctl restart nix-daemon
