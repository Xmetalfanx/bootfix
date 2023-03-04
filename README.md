# Boot repair fix for my old desktop and Ubuntu 22.04 bases 

## Purpose
This is a hyper-spetific repo to fix a problem that I have had post Ubuntu 22.04 (and maybe other distro bases) with an old early 2000's desktop and after the install, it boots to a black cursor and without one extra step, even adding "nomodeset" doesn't boot to a GUI.

## The fix I found

1. Add a Vesa config file
2. Add nomodeset to the default grub file so I dont have to keep typing it out.

## Disclaimer
I am trying to make it where stuff is backed up first, but I do not take responsibility for what happens if you run this on your own computer
