# Packages

Future Noctra packages should live here as PKGBUILD directories.

Initial package targets:

- `noctra-base`: system defaults, nftables rules, Tor config, services
- `noctra-desktop`: KDE layout, theme, icons, SDDM
- `noctra-calamares-config`: installer configuration
- `noctra-tools-core`: lightweight visibility/control tool bundle
- `noctra-tools-offensive`: optional heavier offensive-security tools

Production ISOs should use signed packages from a Noctra repository instead of copying every file directly into `airootfs`.
