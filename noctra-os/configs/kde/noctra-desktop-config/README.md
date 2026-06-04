# Noctra Desktop Config

KDE Plasma defaults for the first Noctra OS ISO.

This is a conservative rootfs overlay. It sets safe global defaults without
hardcoding Plasma panel state that may break across Plasma versions.

Overlay root:

```text
rootfs/
```

Current scope:

- Noctra Dark color scheme
- Breeze Dark look-and-feel baseline
- Papirus-Dark icon preference
- left-side window buttons
- dark lock screen defaults

Deferred until the first booting ISO:

- exact top panel layout
- dock-style bottom panel
- network mode indicator plasmoid
- SDDM theme

