#include <stddef.h>
#include <stdint.h>
#include "memfunc.h"

#define PIC1 0x20
#define PIC2 0xA0

#define ICW1 0x11
#define ICW4 0x01

/* init_pics()
 * Init the PICs and remap them
 */
void init_pics(int pic1, int pic2)
{
	outb(PIC1, ICW1);
	outb(PIC2, ICW1);

	outb(PIC1 + 1, pic1);
	outb(PIC2 + 1, pic2);

	outb(PIC1 + 1, 4);
	outb(PIC2 + 1, 2);

	outb(PIC1 + 1, ICW4);
	outb(PIC2 + 1, ICW4);

	outb(PIC1 + 1, 0xFF);
}
