# Noctra OS Cheatsheet

Living quick reference for the Noctra OS build. Update this file as the distro evolves.

## Repo

GitHub:

```text
https://github.com/isaltydex-crypto/Noctra
```

Clone:

```bash
git clone https://github.com/isaltydex-crypto/Noctra.git
cd Noctra
```

Pull latest changes:

```bash
git pull
```

Current main project folder:

```text
noctra-os/
```

## Build Laptop Setup

Install required Arch packages:

```bash
sudo pacman -Syu
sudo pacman -S --needed git base-devel archiso vim nano openssh
```

Full laptop setup guide:

```text
noctra-os/docs/arch-build-laptop-step-by-step.md
```

## Build ISO

From repo root:

```bash
cd noctra-os
chmod +x tools/prepare-archiso-profile.sh
./tools/prepare-archiso-profile.sh
sudo mkarchiso -v -w /tmp/noctra-work -o ./out ./archiso
```

Expected ISO output:

```text
noctra-os/out/noctra-os-*.iso
```

The live ISO package list must include `mkinitcpio-archiso`. Without it, the generated initramfs may fail to mount the live squashfs root and drop into emergency boot errors such as `Failed to start Switch Root`.

The live initramfs must also be built from:

```text
noctra-os/archiso/airootfs/etc/mkinitcpio.conf.d/archiso.conf
noctra-os/archiso/airootfs/etc/mkinitcpio.d/linux.preset
```

The Noctra first milestone uses a local ISO/USB initramfs only. Keep PXE/NBD/NFS archiso hooks out of `archiso.conf` unless the matching packages are added intentionally.

Clean rebuild:

```bash
cd noctra-os
sudo rm -rf /tmp/noctra-work
./tools/prepare-archiso-profile.sh
sudo mkarchiso -v -w /tmp/noctra-work -o ./out ./archiso
```

Capture build log:

```bash
cd noctra-os
sudo mkarchiso -v -w /tmp/noctra-work -o ./out ./archiso 2>&1 | tee noctra-build.log
```

## Network Modes

Status:

```bash
noctra-network-mode status
```

Lock all traffic back to Tor:

```bash
sudo noctra-network-mode tor-locked
```

Temporarily unlock clearnet for 10 minutes:

```bash
sudo noctra-network-mode clearnet-unlock 10
```

Allowed clearnet unlock duration:

```text
1-240 minutes
```

Current modes:

```text
tor-locked
clearnet-unlock
```

## Network Files

Live ISO copies:

```text
noctra-os/archiso/airootfs/usr/local/bin/noctra-network-mode
noctra-os/archiso/airootfs/etc/noctra/nftables/tor-locked.nft
noctra-os/archiso/airootfs/etc/noctra/nftables/clearnet-unlock.nft
noctra-os/archiso/airootfs/etc/tor/torrc
```

Future package source:

```text
noctra-os/packages/noctra-network/
```

Keep live ISO copies and `packages/noctra-network` in sync until `noctra-network` is built from a signed Noctra repo.

## Package Skeletons

Current package directories:

```text
noctra-os/packages/noctra-base/
noctra-os/packages/noctra-branding/
noctra-os/packages/noctra-calamares-config/
noctra-os/packages/noctra-desktop/
noctra-os/packages/noctra-network/
noctra-os/packages/noctra-tools-core/
noctra-os/packages/noctra-tools-offensive/
```

Build a package locally on Arch:

```bash
cd noctra-os/packages/noctra-network
makepkg -s
```

Production package flow:

```text
clean chroot build -> sign package -> publish Noctra repo -> consume in archiso/packages.x86_64
```

## Key Docs

```text
noctra-os/README.md
noctra-os/docs/arch-build-laptop-step-by-step.md
noctra-os/docs/build-arch-vm.md
noctra-os/docs/branding.md
noctra-os/docs/first-iso-test.md
noctra-os/configs/calamares/README.md
noctra-os/configs/kde/noctra-dark-profile.md
noctra-os/configs/kde/noctra-desktop-config/
noctra-os/docs/network-model.md
noctra-os/docs/security-baseline.md
noctra-os/packages/README.md
```

## Current Product Decisions

```text
Name: Noctra OS
Base: Arch Linux
Desktop: KDE Plasma
Desktop direction: macOS Ventura-inspired
Visual direction: Noctra Dark
Accent: restrained cyan/blue
Installer target: Calamares
Disk encryption: LUKS2 by default
Default network mode: Tor Locked
Clearnet: manual, time-limited unlock
Tooling style: lightweight control/visibility, not a full pentesting distro
Live ISO bootloader: GRUB, UEFI x86_64 only for first milestone
```

## Branding

Current logo status:

```text
Logo: not selected
Direction: premium privacy/security, clear N, SVG-friendly
Accent: restrained cyan/blue
```

Branding doc:

```text
noctra-os/docs/branding.md
```

## First ISO Test Checklist

Full protocol:

```text
noctra-os/docs/first-iso-test.md
```

After booting the ISO:

```bash
noctra-health-check
systemctl status sddm
systemctl status NetworkManager
systemctl status tor
systemctl status nftables
noctra-network-mode status
sudo noctra-network-mode clearnet-unlock 10
noctra-network-mode status
sudo noctra-network-mode tor-locked
```

Check nftables:

```bash
sudo nft list ruleset
```

Check Tor:

```bash
systemctl status tor
nyx
```

## Known Open Work

- First `mkarchiso` build on native Arch laptop
- Fix package availability issues from first build
- Run and record first ISO test protocol
- Build/version-pin Calamares
- Validate `noctra-calamares-config` with `calamares -d`
- Select final logo direction
- Convert selected direction to SVG if needed
- Test Noctra Dark KDE defaults on first booting ISO
- Create real KDE Plasma panel/dock layout config
- Test LUKS2 install flow
- Add panel/network mode indicator
- Build signed Noctra package repository

## Update Log

```text
2026-06-04: Initial cheatsheet created.
2026-06-04: Added Noctra Dark branding direction and logo concept options.
2026-06-04: Removed rejected logo concept files and reset logo status to pending.
2026-06-04: Added first-pass Noctra Calamares config skeleton.
2026-06-04: Added first-pass Noctra Dark KDE config overlay.
2026-06-04: Added Noctra live ISO health-check command.
2026-06-04: Switched first ISO profile to UEFI x86_64 GRUB-only boot.
2026-06-04: Added `archiso` to live package list for archiso initramfs hooks.
2026-06-04: Added `mkinitcpio-archiso` and `squashfs-tools` to fix live-root mounting.
2026-06-04: Added archiso mkinitcpio config and linux preset for live initramfs.
2026-06-07: Reduced archiso initramfs hooks to local ISO/USB boot only.
2026-06-07: Added first ISO test protocol.
```
