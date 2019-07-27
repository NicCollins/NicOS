.section .text
.global gdt_desc

gdt:	
gdt_null:
	.long 0
	.long 0

gdt_code:
	.int 0x0ffff
	.int 0
	.byte 0
	.byte 0b10011010
	.byte 0b11001111
	.byte 0

gdt_data:
	.int 0x0ffff
	.int 0
	.byte 0
	.byte 0b10010010
	.byte 0b11001111
	.byte 0
gdt_end:

gdt_desc:
	.byte (gdt_end) - (gdt)
	.int (gdt)
