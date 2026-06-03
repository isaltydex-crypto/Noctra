# Noctra ASCII Logo Concepts

These concepts are script-friendly, terminal-friendly, and easy to render in installers, shell output, boot messages, README files, and generated docs.

Rules for this direction:

- ASCII-first
- no Unicode dependency
- readable in monospace
- usable in shell scripts with `cat <<'EOF'`
- simple enough to convert into SVG later
- no skulls, no hacker cliches, no noisy terminal art

## A. Bracket Mark

Compact, technical, and easy to use as a prompt/header.

```text
[ NOCTRA ]
```

Expanded:

```text
+---------+
| NOCTRA  |
+---------+
```

Best use:

```text
installer headers, shell prompts, docs, package names
```

## B. Slash N

Minimal monogram that is still easy to type and script.

```text
N/ NOCTRA
```

Expanded:

```text
N /
NOCTRA
```

Best use:

```text
terminal banner, package branding, short mark
```

## C. Dark Node

Feels more security/network oriented without becoming pentest branding.

```text
o-- NOCTRA --o
```

Expanded:

```text
o-----o
|NOCTRA
o-----o
```

Best use:

```text
network mode tools, Tor Locked status, CLI utilities
```

## D. Night Line

Quiet and product-like. Strong candidate for a commercial privacy distro.

```text
--- NOCTRA ---
```

Expanded:

```text
-----[ NOCTRA ]-----
```

Best use:

```text
boot messages, docs, product copy
```

## E. Shield Lite

Simple defensive identity without complex graphics.

```text
/\  NOCTRA
\/  Tor Locked
```

Alternative:

```text
/\
\/ NOCTRA
```

Best use:

```text
security status, installer screens, lock mode
```

## F. Full Terminal Banner

This is the strongest current candidate for first ISO boot/MOTD.

```text
 _   _  ___   ____ _____ ____      _
| \ | |/ _ \ / ___|_   _|  _ \    / \
|  \| | | | | |     | | | |_) |  / _ \
| |\  | |_| | |___  | | |  _ <  / ___ \
|_| \_|\___/ \____| |_| |_| \_\/_/   \_\

Tor Locked by default
```

Best use:

```text
/etc/motd, build logs, installer shell, README
```

## Recommendation

Use a two-tier identity:

```text
Primary terminal/header mark: -----[ NOCTRA ]-----
Full boot/MOTD banner: option F
Short CLI mark: N/ NOCTRA
```

This keeps the brand script-friendly now, while leaving room for a refined SVG symbol later.
