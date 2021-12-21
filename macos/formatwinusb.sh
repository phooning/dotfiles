#!/bin/bash


# Get USB
diskutil list

# Format GPT or MBR
diskutil eraseDisk MS-DOS "WIN" GPT /dev/disk4

# Mount Windows ISO
hdiutil mount WIN11.iso

# rsync everything except install.wim
rsync -vha --exclude=sources/install.wim /Volumes/CCCOMA_X64FRE_EN-US_DV9/* /Volumes/WIN

# wimlib split install.wim
mkdir /Volumes/WIN/sources
wimlib-imagex split /Volumes/CCCOMA_X64FRE_EN-US_DV9/sources/install.wim /Volumes/WIN/sources/install.swm 3800

# Eject
diskutil eject /dev/disk4

