#ifndef MEMFUNC_H
#define MEMFUNC_H

int memcmp(const void*, const void*, size_t);
void* memcpy(void* __restrict, const void* __restrict, size_t);
void* memmove(void*, const void*, size_t);
void* memset(void*, int, size_t);
void outb(unsigned short, unsigned char);

#endif
