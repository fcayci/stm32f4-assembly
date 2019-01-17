@ STM32F4 Discovery - Assembly template
@ Turns on an LED attached to GPIOD Pin 12

@ Start with enabling thumb 32 mode since Cortex-M4 do not work with arm mode
@ Unified syntax is used to enable good of the both words...
@ Make sure to run arm-none-eabi-objdump.exe -d prj1.elf to check if
@ the assembler used proper instructions. (Like ADDS)
.thumb
.syntax unified

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Definitions
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Definitions section. Define all the registers and
@ constants here for code readability.
@ Constants
.equ     LEDDELAY,   100000

@ Register Addresses
@ You can find the base addresses for all the peripherals from Memory Map section
@ RM0008 on page 49. Then the offsets can be found on their relevant sections.
@ As shown in GPIOD_ODR register
.equ     RCC_AHB1ENR,   0x40023830      @ enable clock
.equ     GPIOD_MODER,   0x40020C00      @ PORTD control register low
.equ     GPIOD_ODR,     0x40020C14      @ PORTD output data (Page 172 from RM0008)

.section .text
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Vectors
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Vector table start
@ Add all the exceptions in order here
	.word    __StackTop    @ Top of the stack. This is gotton from the linker script
	.word    _start + 1    @ Reset function, +1 for thumb mode

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Main code starts from here
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

_start:
	@ Enable GPIOD Peripheral Clock
	ldr r6, = RCC_AHB1ENR  @ Load peripheral clock enable register adderess
	ldr r5, [r6]           @ Read its content
	orr r5, 0x00000008     @ Set Bit 3 to enable GPIOD clock
	str r5, [r6]           @ Store back the result in Peripheral clock enable register

	@ Make GIOOD Pin12 as output pin
	ldr r6, = GPIOD_MODER  @ Load GPIOD MODER register address
	ldr r5, [r6]		   @ Read its content
	and r5, 0xFCFFFFFF     @ Clear bits 24, 25 for P12
	orr r5, 0x01000000     @ Write 01 to bits 24, 25 for P12
	str r5, [r6]           @ Store back the result in GPIOD MODER register

	@ Set GIOOD Pin12 to 1
	ldr r6, = GPIOD_ODR    @ Load GPIOD output data register
	ldr r5, = 0x1000       @ Set Pin 12 to 1
	str r5, [r6]           @ Store back the result in GPIOD output data register

loop:
	nop                    @ No operation. Do nothing.
	b loop				   @ Jump to loop
