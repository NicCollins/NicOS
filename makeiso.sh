#! /bin/bash
#Script to compile the Source code
#and create an ISO image

i686-elf-as boot.s -o boot.o
i686-elf-gcc -c graphics.c -o graphics.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-gcc -c memfunc.c -o memfunc.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-gcc -T linker.ld -o nicos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o graphics.o memfunc.o -lgcc
mkdir -p isodir
mkdir -p isodir/boot
cp nicos.bin isodir/boot/
mkdir -p isodir/boot/grub
cp grub.cfg isodir/boot/grub/
grub-mkrescue --output=nicos.iso isodir 
