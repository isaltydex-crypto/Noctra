# First ISO Test Protocol

Use this protocol for the first booting Noctra OS live ISO. The goal is to
produce repeatable test results before changing installer, desktop, or branding
details.

## Test Target

```text
Milestone: first bootable live ISO
Boot mode: UEFI x86_64
Bootloader: GRUB
Network default: Tor Locked
Installer: not validated yet
```

## 1. Build Result

On the Arch build machine:

```bash
cd ~/Noctra/noctra-os
ls -lh out/
sha256sum out/noctra-os-*.iso
```

Record:

```text
ISO filename:
ISO size:
SHA256:
Build date:
```

Expected:

- one `.iso` file exists in `out/`
- ISO size is not zero
- `sha256sum` completes

## 2. Boot Test

Use QEMU UEFI or physical UEFI boot. Legacy/CSM boot is not supported in the
first milestone.

QEMU command:

```bash
cd ~/Noctra/noctra-os
qemu-system-x86_64 \
  -enable-kvm \
  -machine q35 \
  -bios /usr/share/edk2/x64/OVMF.4m.fd \
  -m 4096 \
  -cpu host \
  -vga virtio \
  -display gtk,gl=off \
  -cdrom out/noctra-os-*.iso \
  -boot d
```

Low-RAM fallback:

```bash
qemu-system-x86_64 \
  -machine q35 \
  -bios /usr/share/edk2/x64/OVMF.4m.fd \
  -m 2048 \
  -vga virtio \
  -display gtk,gl=off \
  -cdrom out/noctra-os-*.iso \
  -boot d
```

Expected:

- GRUB menu appears
- `Noctra OS live environment` boots
- safe graphics entry boots if normal graphics fails
- system reaches graphical session or usable terminal

## 3. Health Check

Inside the live system, open Konsole or switch to a TTY and run:

```bash
noctra-health-check
```

Record the full output.

Expected blocking checks:

- `noctra-network-mode` exists
- `nft` exists
- `tor` exists
- `NetworkManager.service` is enabled
- `sddm.service` is enabled
- `tor.service` is enabled
- `nftables.service` is enabled
- nftables ruleset is readable

Warnings about inactive services may be acceptable during early live testing,
but they must be investigated before release.

## 4. Service Status

Run:

```bash
systemctl status sddm --no-pager
systemctl status NetworkManager --no-pager
systemctl status tor --no-pager
systemctl status nftables --no-pager
```

Expected:

- NetworkManager active
- SDDM active if graphical boot succeeded
- Tor active or startable
- nftables active or ruleset loadable

## 5. Network Mode

Run:

```bash
noctra-network-mode status
sudo nft list ruleset | head -n 120
```

Expected:

- mode file reports `tor-locked`
- nftables ruleset contains Noctra Tor Locked rules
- direct outbound traffic is not broadly open by default

## 6. Clearnet Unlock

Run:

```bash
sudo noctra-network-mode clearnet-unlock 10
noctra-network-mode status
sudo nft list ruleset | head -n 120
sudo noctra-network-mode tor-locked
noctra-network-mode status
```

Expected:

- unlock switches mode to `clearnet-unlock`
- relock switches mode back to `tor-locked`
- nftables rules change between modes

## 7. Tor Smoke Test

If network is available:

```bash
systemctl status tor --no-pager
torsocks curl -I https://check.torproject.org/
```

Expected:

- Tor service is running
- `torsocks curl` connects

If `curl` is missing, record that as a package gap.

## 8. Desktop Smoke Test

Check:

- Plasma starts
- Dolphin opens
- Konsole opens
- Firefox opens
- KeePassXC opens
- Wireshark opens
- display resolution is usable
- Noctra Dark colors are visible

## 9. Failure Data

For boot failure, send:

```text
photo of screen
selected GRUB entry
QEMU command or physical device model
```

For build failure, send:

```bash
tail -n 150 noctra-build.log
grep -n "ERROR\|error\|FAILED\|mkinitcpio\|grub\|squashfs\|pacman" noctra-build.log | tail -n 120
```

For service failure, send:

```bash
journalctl -b -p err --no-pager
systemctl status tor nftables sddm NetworkManager --no-pager
sudo nft list ruleset
```

## 10. Pass Criteria

The first ISO milestone passes when:

- ISO builds reproducibly
- GRUB boots in UEFI mode
- live system reaches Plasma or usable TTY
- `noctra-health-check` has no blocking failures
- Tor Locked is the default network mode
- clearnet unlock/relock works
- core desktop apps launch

