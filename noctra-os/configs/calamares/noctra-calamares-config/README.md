# Noctra Calamares Config

First-pass Calamares deployment config for Noctra OS.

Target install path when packaged:

```text
/etc/calamares/
```

This config intentionally lives outside the ArchISO profile until Calamares is built and version-pinned in a signed Noctra package repository.

## Security Defaults

- encrypted installs are the supported default path
- LUKS2 is required by policy
- GRUB cryptodisk support is enabled
- systemd-boot is not used for encrypted installs
- Tor Locked networking is enabled on installed systems
- SDDM and NetworkManager are enabled on installed systems

## Test Before Shipping

Validate against the exact Calamares package version used for the ISO:

```bash
calamares -d
```

Then perform at least one full VM install with:

- automatic partitioning
- encryption enabled
- UEFI boot
- reboot into installed system
- `nft list ruleset`
- `noctra-network-mode status`

