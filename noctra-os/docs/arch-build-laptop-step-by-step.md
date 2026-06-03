# Arch Build Laptop: Step-by-Step

This guide sets up a separate laptop as a native Arch Linux build machine for Noctra OS. It avoids a VM and uses the laptop directly for `mkarchiso` builds.

Use the official Arch installation guide as the source of truth if anything differs:

- https://wiki.archlinux.org/title/Installation_guide
- https://wiki.archlinux.org/title/Archiso
- https://man.archlinux.org/man/mkarchiso.1.en

## 0. What You Need

- Build laptop
- USB stick, 2 GB or larger, for the Arch installer
- Stable internet connection
- At least 30-40 GB free disk
- GitHub repo: `https://github.com/isaltydex-crypto/Noctra`

Recommended laptop specs:

- 4 GB RAM minimum
- 8 GB RAM preferred
- SSD strongly preferred

## 1. Download Arch Linux ISO

On any machine:

1. Go to https://archlinux.org/download/
2. Download the latest ISO.
3. Optional but recommended: verify the ISO signature/checksum from the same download page.

## 2. Create Bootable USB

On Windows, use one of these:

- Rufus
- balenaEtcher
- Ventoy

Recommended Rufus settings:

- Partition scheme: GPT
- Target system: UEFI
- File system: FAT32 if available
- Write mode: DD mode if Rufus asks

## 3. Boot the Laptop From USB

1. Insert the USB stick.
2. Open the laptop boot menu.
3. Select the USB device.
4. Boot into `Arch Linux install medium`.

If Secure Boot blocks booting, disable Secure Boot temporarily in BIOS/UEFI.

## 4. Connect to Internet

For Ethernet, it usually works automatically.

For Wi-Fi:

```bash
iwctl
device list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect "YOUR_WIFI_NAME"
exit
```

Test connectivity:

```bash
ping -c 3 archlinux.org
```

If your Wi-Fi device is not `wlan0`, use the device name shown by `device list`.

## 5. Use the Fast Install Path

For this build laptop, using `archinstall` is fine. We do not need a perfect daily-driver setup; we need a reliable Arch machine that can build ISOs.

Start:

```bash
archinstall
```

Recommended choices:

- Mirrors: Sweden or nearby country
- Disk configuration: use an entire disk
- Filesystem: ext4 or btrfs
- Disk encryption: optional for the build laptop
- Bootloader: systemd-boot for UEFI
- Profile: minimal
- Audio: pipewire or none
- Network: NetworkManager
- Kernel: linux
- Additional packages:

```text
git base-devel archiso vim nano openssh
```

Create a normal user and give it sudo/admin rights when prompted.

When install finishes:

```bash
reboot
```

Remove the USB stick when the laptop restarts.

## 6. First Login After Install

Log in as your normal user.

Update the system:

```bash
sudo pacman -Syu
```

Install build tools if they were not added during install:

```bash
sudo pacman -S --needed git base-devel archiso vim nano openssh
```

Enable NetworkManager if needed:

```bash
sudo systemctl enable --now NetworkManager
```

## 7. Set Up Git

Set your Git identity. Use your real GitHub noreply address if you want cleaner GitHub commits.

```bash
git config --global user.name "Logii"
git config --global user.email "YOUR_EMAIL_HERE"
```

Clone Noctra:

```bash
git clone https://github.com/isaltydex-crypto/Noctra.git
cd Noctra
```

If the repo is private, GitHub may ask for credentials or a personal access token.

## 8. Build First Noctra ISO

From the cloned repo root:

```bash
cd noctra-os
chmod +x tools/prepare-archiso-profile.sh
./tools/prepare-archiso-profile.sh
sudo mkarchiso -v -w /tmp/noctra-work -o ./out ./archiso
```

Expected output:

```text
noctra-os/out/noctra-os-*.iso
```

## 9. If the Build Fails

Save the log:

```bash
sudo mkarchiso -v -w /tmp/noctra-work -o ./out ./archiso 2>&1 | tee noctra-build.log
```

Send back:

- the last 80-150 lines of `noctra-build.log`
- the exact command you ran
- laptop architecture if unusual

Useful quick checks:

```bash
pacman -Q archiso
ls -la noctra-os/archiso
ls -la noctra-os/out
```

## 10. Clean Build Directory

If you need to rebuild from scratch:

```bash
sudo rm -rf /tmp/noctra-work
sudo mkarchiso -v -w /tmp/noctra-work -o ./out ./archiso
```

Only delete `/tmp/noctra-work`. Do not delete the repo.

## 11. Test the ISO

Best first test is another machine or a VM if available. If the laptop has enough space, you can install QEMU:

```bash
sudo pacman -S --needed qemu-full edk2-ovmf
```

Then run:

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -m 4096 \
  -cpu host \
  -cdrom out/noctra-os-*.iso \
  -boot d
```

If RAM is limited, test on a separate USB or another machine instead.

## 12. Sync Changes Later

When I update the repo from the Windows machine and push changes:

```bash
cd Noctra
git pull
cd noctra-os
./tools/prepare-archiso-profile.sh
sudo rm -rf /tmp/noctra-work
sudo mkarchiso -v -w /tmp/noctra-work -o ./out ./archiso
```

## Manual Install Fallback

If `archinstall` fails, use the official Arch installation guide:

https://wiki.archlinux.org/title/Installation_guide

Minimum target for this laptop:

- UEFI boot
- one Linux root partition
- `base linux linux-firmware`
- NetworkManager
- normal sudo user
- `git base-devel archiso`

The build laptop does not need KDE, Calamares, or Noctra branding installed locally. Those belong inside the ISO profile.
