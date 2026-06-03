#!/usr/bin/env bash
set -euo pipefail

profile_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/../archiso" && pwd)"
systemd_dir="${profile_dir}/airootfs/etc/systemd/system"

install -d "${systemd_dir}/multi-user.target.wants"
install -d "${systemd_dir}/graphical.target.wants"

chmod +x "${profile_dir}/airootfs/root/noctra-firstboot.sh"
chmod +x "${profile_dir}/airootfs/usr/local/bin/noctra-network-mode"

ln -sfn ../noctra-firstboot.service "${systemd_dir}/multi-user.target.wants/noctra-firstboot.service"
ln -sfn /usr/lib/systemd/system/NetworkManager.service "${systemd_dir}/multi-user.target.wants/NetworkManager.service"
ln -sfn /usr/lib/systemd/system/tor.service "${systemd_dir}/multi-user.target.wants/tor.service"
ln -sfn /usr/lib/systemd/system/nftables.service "${systemd_dir}/multi-user.target.wants/nftables.service"
ln -sfn /usr/lib/systemd/system/sddm.service "${systemd_dir}/graphical.target.wants/sddm.service"

printf 'Prepared ArchISO profile at %s\n' "${profile_dir}"
