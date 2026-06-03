# Noctra Network Model

Noctra has two initial network modes.

## Tor Locked

Default mode.

- DNS is sent to Tor `DNSPort`
- TCP is redirected to Tor `TransPort`
- traffic from the Tor daemon itself is allowed directly
- loopback is allowed
- established connections are allowed
- outbound IPv6 is blocked in the first version
- UDP is blocked except local DHCP where needed
- all other outbound traffic is dropped

This is a privacy desktop model, not a Qubes-style compartmentalized VM model.

## Clearnet Unlock

Manual, admin-only, time-limited escape hatch.

Target behavior:

- requires privilege escalation
- switches nftables policy from Tor Locked to Clearnet Unlock
- starts a timer, for example 10, 30, or 60 minutes
- restores Tor Locked automatically when time expires
- writes a local audit line to the journal
- panel indicator shows current mode

## Future App-Based Mode

A later version can add per-app clearnet by running approved programs under a dedicated `clearnet` group or user and allowing direct outbound traffic only for that identity.

This gives better control than a global switch without requiring Qubes-style VM isolation.
