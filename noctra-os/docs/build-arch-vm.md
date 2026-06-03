# Build Guide: Arch VM

## Recommended VM

- OS: latest Arch Linux x86_64
- CPU: 4 cores
- RAM: 8 GB minimum
- Disk: 40-80 GB
- Network: enabled for package downloads

If you are using a separate laptop instead of a VM, follow `docs/arch-build-laptop-step-by-step.md`.

## Install Build Tools

```bash
sudo pacman -Syu
sudo pacman -S --needed archiso git base-devel
```

## Build ISO

From the repository root:

```bash
cd noctra-os
chmod +x tools/prepare-archiso-profile.sh
./tools/prepare-archiso-profile.sh
sudo mkarchiso -v -w /tmp/noctra-work -o ./out ./archiso
```

The ISO will be written to `noctra-os/out/`.

## Calamares Packaging Note

Calamares is not treated here as an official Arch repository dependency. For production, build it as a controlled Noctra package and host it in a signed custom repository, then add that repository to `archiso/pacman.conf`.

Do not rely on a random AUR helper during ISO builds. Production builds should be reproducible and auditable.

## File Permissions

When copying this project into the Arch VM, make sure the prepare script is executable:

```bash
chmod +x tools/prepare-archiso-profile.sh
```

## References

- ArchISO: https://wiki.archlinux.org/title/Archiso
- mkarchiso manual: https://man.archlinux.org/man/extra/archiso/mkarchiso.1.en
