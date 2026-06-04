# Calamares Policy

Noctra should ship Calamares as a controlled package from a signed Noctra repository.

## Required Installer Behavior

- full-disk encryption is selected by default
- LUKS2 is used for encrypted installs
- unencrypted install path is hidden or clearly marked unsupported
- swap is encrypted or omitted
- NetworkManager, Tor, nftables, and SDDM are enabled on installed systems
- Noctra Tor Locked mode is installed as default

## Production Modules To Configure

- welcome
- locale
- keyboard
- partition
- users
- unpackfs
- machineid
- fstab
- bootloader
- initcpio
- services-systemd
- shellprocess
- finished

## Current Skeleton

First-pass deployment config:

```text
noctra-os/configs/calamares/noctra-calamares-config/
```

Target package install path:

```text
/etc/calamares/
```

Notes:

- Calamares should still come from a signed Noctra repository.
- The config must be validated against the exact Calamares version used in the ISO.
- LUKS2 and GRUB cryptodisk are policy requirements, but module key names may need adjustment after the first `calamares -d` run.

## Open Work

- build `calamares` package
- package `noctra-calamares-config`
- test encrypted install in a VM
- verify bootloader with encrypted root
