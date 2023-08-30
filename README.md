# Monomaniac

A mod to jump toggle the main norns input from stereo to mono.

# Instructions

Install the mod, and it will appear `SYSTEM > MODS`, disabled by default. Enable it, restart norns. `E3` clockwise will enable mono input, or more precisely routing left input to both left and right channels. Clockwise will return back to routing left input to left channel and right input to right channel.

Note the mod will not currently save state and does not *actually* know if it is in mono or stereo mode.. sorry this is a little sketchy. Use your ears! Rebooting norns will always return norns to the nornal stereo mode.

# Background

I recently got into Eurorack, and have no output module. So everything is hard left, which gets on your nerves at some point.

![](monothering.gif)

I mix between using NTS-1 and it's ensembler, the above OG mono-to-sterea cable half-insertion "hack", and now wrote this.

The name is from Scarletron's 1998 killing electro track, which has been an earworm of mine for... yes 25 years now. Play it loud!!

# Installation

```lua
;install https://github.com/xmacex/monomaniac
```
