# Security Baseline

## Required Defaults

- LUKS2 full-disk encryption during install
- encrypted swap or no swap by default
- nftables enabled
- Tor service enabled
- IPv6 disabled or blocked until explicitly supported
- NetworkManager enabled
- no SSH server by default
- no broad inbound services by default

## Recommended Packages

- `linux-hardened` as an optional kernel profile
- `intel-ucode`
- `amd-ucode`
- `usbguard`
- `keepassxc`
- `firejail` as an optional hardening tool

## Browser Policy

Initial browser choice should be LibreWolf if package availability is handled through a controlled repository. Otherwise use Firefox with a hardened Noctra profile until LibreWolf packaging is finalized.

## Secure Boot

Secure Boot support is a later milestone. Do not present the first ISO as Secure Boot-ready unless the boot chain is actually signed and tested.
