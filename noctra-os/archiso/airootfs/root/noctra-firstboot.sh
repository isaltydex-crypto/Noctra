#!/usr/bin/env bash
set -euo pipefail

systemctl enable NetworkManager.service
systemctl enable sddm.service
systemctl enable tor.service
systemctl enable nftables.service

install -d -m 0755 /etc/noctra
printf '%s\n' 'tor-locked' > /etc/noctra/network-mode

if id liveuser >/dev/null 2>&1; then
  usermod -aG wheel,wireshark liveuser || true
fi
