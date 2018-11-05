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

void draw_splash() {
	uint8_t blue_color = make_color(COLOR_LIGHT_BLUE, COLOR_BLACK);
	uint8_t white_color = make_color(COLOR_WHITE, COLOR_BLACK);

	draw_frame(21, 56, 5, 19, white_color);	
}
