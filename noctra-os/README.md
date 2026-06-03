# Noctra OS

Noctra OS is an Arch-based privacy desktop distribution focused on a friendly KDE Plasma experience, strong default encryption, Tor-first networking, and practical local visibility tools.

## Product Direction

- Base: Arch Linux, built with `archiso`
- Desktop: KDE Plasma with a macOS Ventura-inspired layout and theme
- Installer: Calamares with full-disk encryption as the default path
- Network default: Tor Locked mode
- Manual network escape hatch: time-limited Clearnet Unlock mode
- Security posture: LUKS2, nftables kill switch, Tor DNS/TCP transport, USB policy, browser hardening
- Tools: lightweight control/visibility set, not a full pentesting distribution

## Repository Layout

```text
noctra-os/
  archiso/                 ArchISO profile
  configs/
    calamares/             Installer policy and module notes
    kde/                   KDE/macOS-style desktop notes
    nftables/              Tor Locked and Clearnet Unlock firewall policies
    tor/                   Tor transparent proxy configuration
  docs/                    Build and design documentation
  packages/                Future Noctra metapackages / PKGBUILDs
```

## First Milestone

The first milestone is a bootable live ISO that starts Plasma, runs Tor Locked mode by default, includes core network visibility tools, and carries Calamares configuration ready for a custom `calamares` package.

## Build Host

Use a clean Arch Linux VM for ISO builds. Windows and WSL are fine for editing this repository, but `mkarchiso` should be run on Arch for predictable results.

See `docs/build-arch-vm.md`.

For a native build laptop without a VM, see `docs/arch-build-laptop-step-by-step.md`.

For quick commands and current project state, see `docs/cheatsheet.md`.
