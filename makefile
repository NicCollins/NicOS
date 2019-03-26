CC=i686-elf-gcc

nicos.iso : dir cp
	grub-mkrescue --output=nicos.iso isodir

dir :
	mkdir -p isodir
	mkdir -p isodir/boot
	mkdir -p isodir/boot/grub

cp : nicos.bin grub.cfg
	cp nicos.bin isodir/boot/
	cp grub.cfg isodir/boot/grub/

nicos.bin : linker.ld boot.o graphics.o splash.o kernel.o memfunc.o
	${CC} -T linker.ld -o nicos.bin -ffreestanding -O2 -nostdlib \
		boot.o kernel.o graphics.o memfunc.o splash.o -lgcc

boot.o : boot.s
	i686-elf-as boot.s -o boot.o

kernel.o : kernel.c graphics.h splash.h
	${CC} -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 \
		-Wall -Wextra

graphics.o : graphics.c
	${CC} -c graphics.c -o graphics.o -std=gnu99 -ffreestanding -O2 \
		-Wall -Wextra

memfunc.o : memfunc.c
	${CC} -c memfunc.c -o memfunc.o -std=gnu99 -ffreestanding -O2 \
		-Wall -Wextra

splash.o : splash.c graphics.h
	${CC} -c splash.c -o splash.o -std=gnu99 -ffreestanding -O2 \
		-Wall -Wextra

clean :
	rm nicos.iso nicos.bin boot.o kernel.o graphics.o memfunc.o splash.o
	rm -rf isodir

run :
	qemu-system-i386 nicos.iso
