#!/bin/bash
#hpl
#20110820
#lauch a iso grub with (possibly extra devices)

#single cdrom
#qemu -cdrom grub.iso -boot d

#with xp disk image
qemu -cdrom grub.iso -boot d
