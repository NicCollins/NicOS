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

nicos.bin : linker.ld boot.o graphics.o splash.o kernel.o memfunc.o pic.o
	${CC} -T linker.ld -o nicos.bin -ffreestanding -O2 -nostdlib \
		*.o -lgcc

boot.o : boot.s gdt.o
	i686-elf-as boot.s -o boot.o

gdt.o : gdt.s
	i686-elf-as gdt.s -o gdt.o

kernel.o : kernel.c graphics.h splash.h pic.h
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

pic.o : pic.c
	${CC} -c pic.c -o pic.o -std=gnu99 -ffreestanding -O2 \
		-Wall -Wextra

clean : clean_o clean_iso clean_bin

clean_o :
	rm *.o

clean_iso :
	rm nicos.iso
	rm -rf isodir

clean_bin :
	rm nicos.bin

run :
	qemu-system-i386 nicos.iso -d int -D qemu.log
