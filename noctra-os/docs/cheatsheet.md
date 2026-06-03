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
```

## Branding

Current logo directions:

```text
A: Crescent moon inside shield
B: Minimal N monogram with shadow cut
C: Eclipse or horizon mark
D: Shield with network/lock geometry
```

Branding doc:

```text
noctra-os/docs/branding.md
noctra-os/docs/assets/noctra-logo-concepts-v1.png
```

## First ISO Test Checklist

After booting the ISO:

```bash
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
- Select final logo direction
- Convert selected logo to SVG
- Create real KDE Plasma layout config
- Build and package Calamares
- Create `noctra-calamares-config`
- Test LUKS2 install flow
- Add panel/network mode indicator
- Build signed Noctra package repository

## Update Log

```text
2026-06-04: Initial cheatsheet created.
2026-06-04: Added Noctra Dark branding direction and logo concept options.
```
