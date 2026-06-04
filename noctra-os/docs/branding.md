# Noctra OS Branding

Living brand direction for Noctra OS.

## Selected Direction

```text
Visual direction: Noctra Dark
Accent: restrained cyan/blue
Logo direction: pending selection from concept options
Network mode names: Tor Locked / Clearnet Unlock
Product tone: serious privacy product with premium cyber/security feel
Avoid: pentesting-distro tone, hacker cliches, skulls, neon overload
```

## Palette

Noctra should feel dark, calm, and controlled. Cyan/blue is an accent, not the dominant surface color.

```text
Background 0: #07090d
Background 1: #0d1117
Surface 0:    #111820
Surface 1:    #17202a
Border:       #263241
Text primary: #f2f6fb
Text muted:   #9aa7b6
Accent:       #18bdf2
Accent dim:   #0b6f94
Secure:       #41d67b
Warning:      #f2b84b
Danger:       #ef5f67
```

## Logo Concepts

The first raster concept sheet was rejected. The current direction is ASCII/script-friendly branding:

```text
docs/ascii-logo-concepts.md
```

Current recommended identity:

```text
Primary terminal/header mark: Arch-style Noctra N mark
Full boot/MOTD banner: Noctra N mark + ASCII NOCTRA wordmark
Short CLI mark: N/ NOCTRA
```

The current logo direction is Arch-like in terminal-art texture, but shaped as a Noctra `N` instead of an Arch `A`. It should stay Noctra-specific and avoid copying the official Arch Linux mark. The first production graphic logo can still be recreated as SVG later, but the early distro identity should work cleanly in shell scripts, install logs, terminal banners, and docs.

## N Logo Concepts

Normal logo sketch sheet:

```text
docs/assets/noctra-n-logo-concepts-v1.png
```

Concept directions:

```text
A: sharp angular N peak
B: shield-shaped N negative space
C: crescent/night-cut N
D: monoline geometric N
E: split N with privacy veil
F: terminal/circuit N
G: folded ribbon N
H: compact app-icon N
```

Selection criteria:

- must clearly read as `N`
- must work as app icon and OS mark
- must be simple enough to redraw as SVG
- should feel premium/privacy, not pentesting
- should avoid copying Arch Linux directly

## Typography Direction

Use clean geometric sans-serif typography. The wordmark should be wide, calm, and technical without becoming sci-fi.

Recommended system/package starting points:

```text
Inter
Noto Sans
IBM Plex Sans
```

Avoid overly futuristic fonts that reduce readability.

## UI Tone

Noctra UI copy should be direct and practical.

Use:

```text
Tor Locked
Clearnet Unlock
Network protected
Direct access expires in 10 minutes
```

Avoid:

```text
Elite hacker mode
Military grade
Unbreakable
Anonymous forever
```

## Commercial Positioning

Noctra OS should be positioned as a privacy-first desktop with strong local control and security visibility. It should not be marketed as a pentesting distribution.

Short product line:

```text
Noctra OS is a privacy-first Arch-based desktop built for encrypted systems, Tor-first networking, and practical control over your local environment.
```

## Asset Plan

Future assets:

```text
ascii-logo.txt
logo-symbol.svg
logo-wordmark.svg
wallpaper-default.png
sddm-theme/
plasma-look-and-feel/
noctra-color-scheme.colors
```

The first production logo should be deterministic and reproducible. Prefer ASCII and SVG assets over AI-generated raster logos.
