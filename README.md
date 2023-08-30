# Monomaniac

A mod to toggle stereo and mono input

I recently got into Eurorack, and have no output module. So everything is hard left mono, which will drive you a maniac.

![](monothering.gif)

I swap between the above OG mono-to-sterea cable half-insertion "hack", using NTS-1 and it's ensembler which spreads left across both inputs... and now wrote this. Maybe you will benefit fomr it too?

Some norns script have an option to only record from left input. Great! Not all do, so this is a system level routing change at the level of Jack which will reroute left input audio to both left and right input channels. It is messing with stuff underlying norns, hence no state saving at this stage.

Comments, feedback etc of course welcome!

## Requirements

norns

## Documentation

Install the mod, and it will appear `SYSTEM > MODS`, disabled by default. Enable it, restart norns. `E3` clockwise will enable mono input, or more precisely routing left input to both left and right channels. Clockwise will return back to routing left input to left channel and right input to right channel.

Note the mod will not currently save state and does not *actually* know if it is in mono or stereo mode.. sorry this is a little sketchy. Use your ears! Rebooting norns will always return norns to the nornal stereo mode.

I often have multiple input devices besides the audio jacks on norns (mine is the shield), but in it's current form this does not make those mono (I don't need this feature now), or allow selecting which ones to make mono and which not.

The name is from [Scarletron's 1998 killing electro track](https://youtu.be/54S5h1Zktaw), which has been an earworm of mine for... yes 25 years now. Play it loud!!

## Download

Install with the following command in Maiden

```lua
;install https://github.com/xmacex/monomaniac
```
