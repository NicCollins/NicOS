#ifndef GRAPHICS_H_INCLUDED
#define GRAPHICS_H_INCLUDED

enum vga_color {
	COLOR_BLACK = 0,
	COLOR_BLUE = 1,
	COLOR_LIGHT_BLUE = 9,
	COLOR_WHITE = 15
};

uint8_t make_color(enum vga_color fg, enum vga_color bg);

void terminal_initialize();

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y);

void terminal_writestring(const char* data);

void terminal_writestringat(const char* data, size_t x, size_t y, uint8_t color);

#endif
