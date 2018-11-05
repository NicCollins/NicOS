#include <stddef.h>
#include <stdint.h>

#include "graphics.h"

void draw_frame(size_t start_x, size_t end_x, size_t start_y, size_t end_y, uint8_t color) {
	for (size_t x = start_x; x <= end_x; x++) {
		for (size_t y = start_y; y <= end_y; y++) {
			if (y < start_y + 2 || y > end_y - 2) {
				terminal_putentryat('*', color, x, y);
			}
			if (x < start_x + 2 || x > end_x -2) {
				terminal_putentryat('*', color, x, y);
			}
		}
	}
}

void draw_logo(size_t start_x, size_t start_y, uint8_t color) {
	char* l1 = "NNNN   NN           OO    SS  ";
	char* l2 = "NNNN   NN II       OOOO  SSSS ";
	char* l3 = "NNN N  NN II      OO  OO S  SS";
	char* l4 = "NNN N  NN         OO  OO S    ";
	char* l5 = "NNN  N NN II CCCC OO  OO  SSS ";
	char* l6 = "NNN  N NN II CCCC OO  OO    SS";
	char* l7 = "NNN   NNN II CC   OO  OO S  SS";
	char* l8 = "NNN   NNN II CCCC  OOOO  SSSS ";
	char* l9 = "NNN    NN II CCCC   OO    SS  ";

	terminal_writestringat(l1, start_x, start_y, color);
	terminal_writestringat(l2, start_x, start_y + 1, color);
	terminal_writestringat(l3, start_x, start_y + 2, color);
	terminal_writestringat(l4, start_x ,start_y + 3, color);
	terminal_writestringat(l5, start_x, start_y + 4, color);
	terminal_writestringat(l6, start_x, start_y + 5, color);
	terminal_writestringat(l7, start_x, start_y + 6, color);
	terminal_writestringat(l8, start_x, start_y + 7, color);
	terminal_writestringat(l9, start_x, start_y + 8, color);
}

void draw_splash() {
	uint8_t blue_color = make_color(COLOR_LIGHT_BLUE, COLOR_BLACK);
	uint8_t white_color = make_color(COLOR_WHITE, COLOR_BLACK);

	draw_frame(21, 56, 5, 19, white_color);
	draw_logo(24, 8, blue_color);
}
