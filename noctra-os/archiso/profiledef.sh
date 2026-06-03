#!/usr/bin/env bash
#
# Noctra OS ArchISO profile.

iso_name="noctra-os"
iso_label="NOCTRA_$(date +%Y%m)"
iso_publisher="Noctra OS <https://example.invalid>"
iso_application="Noctra OS Live/Install Media"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-ia32.grub.esp' 'uefi-x64.grub.esp' 'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-b' '1M' '-Xbcj' 'x86')
file_permissions=(
  ["/root/noctra-firstboot.sh"]="0:0:755"
  ["/usr/local/bin/noctra-network-mode"]="0:0:755"
)
