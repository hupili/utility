#!/bin/bash

#from cdrom
#qemu -m 1024 -cdrom "/mnt/neso/soft/systems/Windows.XP/WinXP_Pro_VOL_SP2_EN.ISO" -hda /mnt/portable/storage/disk-image/di.5g.xp -boot order=d

#from harddisk, with cdrom xp-en
#qemu -m 1024 -cdrom "/mnt/neso/soft/systems/Windows.XP/WinXP_Pro_VOL_SP2_EN.ISO" -hda /mnt/portable/storage/disk-image/di.5g.xp 

#from harddisk, with cdrom xp-cn
#qemu -m 1024 -cdrom "/mnt/neso/soft/systems/Windows.XP/Microsoft.Windows.XP.Professional.SP2.VOL.CHS/VRMPVOL_CN.iso" -hda /mnt/portable/storage/disk-image/di.5g.xp 

#from harddisk only harddisk
#qemu -m 1024 -hda /mnt/portable/storage/disk-image/di.5g.xp 

#from haddisk, with std vga option
#qemu -m 1024 -hda /mnt/portable/storage/disk-image/di.5g.xp -vga std

qemu -m 1024 -hda /dev/sdb -vga std

