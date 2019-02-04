/* linker script for STM32F407VG chip */

MEMORY {
	rom (rx)  : ORIGIN = 0x08000000, LENGTH = 1024K
	ram (rwx) : ORIGIN = 0x20000000, LENGTH =  128K
}

SECTIONS {
	.text ORIGIN(rom) :
	{
		KEEP(*(.vectors))  /* Vector table */
		*(.text*)          /* Program code */
		*(.rodata*)        /* Read only data */
		. = ALIGN(4);
		__etext = .;
	}

	_sidata = .;

	.data ORIGIN(ram) :  AT ( ADDR (.text) + SIZEOF (.text) )
	{
		__data_start__ = .;
		*(.data*)      /* Read-write initialized data */
		. = ALIGN(4);
		__data_end__ = .;
	}


	.bss ADDR (.data) + SIZEOF (.data):
	{
		__bss_start__ = .;
		. = ALIGN(4);
		*(.bss*)       /* Read-write zero initialized data */
		*(COMMON)
		. = ALIGN(4);
		__bss_end__ = .;
	}
}

__StackTop = ORIGIN(ram) + LENGTH(ram);
__text_size = SIZEOF (.text);
__data_size = SIZEOF (.data);
__bss_size  = SIZEOF (.bss);
