# Packages

Future Noctra packages should live here as PKGBUILD directories.

Initial package targets:

- `noctra-base`: system defaults, nftables rules, Tor config, services
- `noctra-branding`: Noctra identity, palette, and future assets
- `noctra-desktop`: KDE layout, theme, icons, SDDM
- `noctra-calamares-config`: installer configuration
- `noctra-tools-core`: lightweight visibility/control tool bundle
- `noctra-tools-offensive`: optional heavier offensive-security tools

Production ISOs should use signed packages from a Noctra repository instead of copying every file directly into `airootfs`.

## Current State

The first ISO still copies network files directly into `archiso/airootfs` so it can boot before a Noctra package repository exists.

`packages/noctra-network` mirrors those files as the future package source. Once the package builds cleanly and is hosted in a signed repository, remove the duplicated network files from `airootfs` and add `noctra-network` to `archiso/packages.x86_64`.

## Local Package Build

On an Arch build machine:

```bash
cd noctra-os/packages/noctra-network
makepkg -s
```

Build the installer config package:

```bash
cd noctra-os/packages/noctra-calamares-config
makepkg -s
```

For production:

1. build packages in a clean chroot
2. sign packages
3. publish them to the Noctra repository
4. add the repository to `archiso/pacman.conf`
5. consume packages through `archiso/packages.x86_64`
