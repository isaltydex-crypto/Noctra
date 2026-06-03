# Noctra Dark KDE Profile

Target: KDE Plasma with a macOS Ventura-inspired layout using Noctra Dark branding.

## Layout

```text
Top panel:
  height: 28-32 px
  left: launcher, global/app menu where practical
  center: active window title or empty space
  right: network mode indicator, network, audio, battery, clock

Bottom dock:
  height: 56-64 px
  centered icons
  auto-hide optional after first release
  pinned apps: Firefox, Dolphin, Konsole, System Settings, KeePassXC, Wireshark

Window controls:
  left side
```

## Theme Direction

```text
Plasma style: Breeze base
Color scheme: Noctra Dark
Icons: Papirus initially, custom Noctra icons later
Cursor: Breeze
Fonts: Noto Sans or Inter
Login: SDDM Noctra Dark later
```

## Color Usage

Use graphite and near-black surfaces. Cyan/blue should only appear on:

```text
active controls
focus rings
network status highlights
small logo accent
selected launcher/dock state
```

Avoid full-screen cyan gradients or heavy blue surfaces.

## First Boot Desktop Goals

On first boot the user should immediately see:

```text
Noctra identity
dark polished desktop
Tor Locked status visible
simple dock with expected desktop apps
no pentest-heavy visual language
```

## Implementation Notes

KDE defaults can be shipped through a future `noctra-desktop` or `noctra-branding` package using:

```text
/usr/share/plasma/look-and-feel/
/usr/share/color-schemes/
/usr/share/sddm/themes/
/etc/xdg/
```

Do not overfit the first ISO. Get a reliable booting Plasma session first, then iterate on exact panels and themes.
