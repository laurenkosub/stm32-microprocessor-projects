@; stm32L476Disco_GreenLED.S wmh 2019-09-16 : drivers for green LED on STM32L476 Discovery  board
@; adds void-void functions GreenLED_ON() and GreenLED_OFF(), renames initGPIOE8() to GreenLED_INIT() 
@; GreenLED.S wmh 2019-08-21 : functions initializing and controlling the green LED at port pin PE8 on the STM32L476 Discovery board
@; uppercase 'S' file extension tells GCC to use preprocessor to interpret '#define' definitions 

	@;useful macro
	.macro MOV_imm32 reg, constant
		movw \reg, #:lower16:\constant
		movt \reg, #:upper16:\constant
	.endm


	@;constants derived from those defined in the STM32L476 manual (RM0351, en.DM00083560.pdf)
	.equ	RCC_BASE,0x40021000 	@;origin of RCC register struct (pg 78 of the manual)
	.equ 	RCC_AHB2ENR,0x4C		@;GPIOE peripheral clock enable register (pg 280 of the manual)
	.equ	GPIOEEN,4				@;GPIOE peripheral clock enable bit (pg 280 of the manual)

	.equ	GPIOE_BASE,0x48001000	@;origin of GPIO E register struct (pg 77 of the manual)
	.equ	MODER,	0x00			@;GPIOE configuration register offsets (pg 311 of the manual)      
	.equ	OTYPER,	0x04	    	@; .. 
	.equ	OSPEEDR,0x08	    	@; .. 
	.equ	OPUPDR,	0x0C	    	@; .. 	
	.equ	IDR,	0x10	    	@; .. 	      
	.equ	ODR,	0x14	    	@; .. 	
	.equ	BSRR,	0x18	    	@; .. 	      
	.equ	LCKR,	0x1C	    	@; .. 	
	.equ	AFRL,	0x20	    	@; .. 	
	.equ	AFRH,	0x24	    	@; .. 	
	.equ	BRR,	0x28	    	@; .. 
	.equ	ASCR,	0x2C	    	@; .. 
	.equ	PE8,	8				@; bit number 8 of GPIOE
	
	.syntax unified				@; ARM Unified Assembler Language (UAL) is allowed 
	.thumb						@; we're using thumb instructions only

	.text
	.global GreenLED_init
	.thumb_func
GreenLED_init: @;configure port bit PE8 as GPIO output with high-speed push/pull drivers and no pu/pd. 
	push {r7,lr}
	@; set port enable bit (pg 251 of the manual)
	mov_imm32 r3,RCC_BASE		@;load RCC struct address
	ldr r2,[r3,#RCC_AHB2ENR]	@;get current values of device enables
	orr r2,#(1<<GPIOEEN)		@;enable port
	str r2,[r3,#RCC_AHB2ENR]	@; ..
	
	@; configure as an output (pg 303 of the manual)
	mov_imm32 r3,GPIOE_BASE		@;load GPIOE struct address
	ldr r2,[r3,#MODER]			@;get current mode values of port
	bic r2,#(3<<(2*PE8))		@;clear current mode value of port bit
	orr	r2,#(1<<(2*PE8))		@;set new mode value of port bit to general purpose output
	str r2,[r3,#MODER]			@; ..
	
	@; configure output as push/pull (pg 304 of the manual)
	ldr r2,[r3,#OTYPER]			@;get current push/pull settings of port
	bic r2,#(1<<(1*PE8))		@;clear current control value of port bit (=push/pull) 
	str r2,[r3,#OTYPER]			@; ..

	@; configure output as high speed (pg 304 of the manual)
	ldr r2,[r3,#OSPEEDR]		@;get current speed values of port
	bic r2,#(3<<(2*PE8))		@;clear current speed value of port bit
	orr	r2,#(2<<(2*PE8))		@;set new speed of port bit as high speed
	str r2,[r3,#OSPEEDR]		@; ..

	@; configure output as no pullup, pulldown
	ldr r2,[r3,#OPUPDR]			@;get current pu/pd settings of port
	bic r2,#(3<<(2*PE8))		@;clear current pupd value of port bit (=no pu/pd)
	str r2,[r3,#OPUPDR]			@; ..

	pop {r7,pc}					@; return to caller


	.text
	.global GreenLED_OFF
	.thumb_func
GreenLED_OFF: @;turn 'L476 Discovery board's green LED off (GPIOE PE8 => 0) 
	push {r7,lr}
	mov_imm32 r3,GPIOE_BASE		@;r3= GPIOE struct address
	mov r2,#(1<<(16+PE8))		@;r2= BR8 (see RM0351 Table 39. GPIO register map)
	str r2,[r3,#BSRR]			@;reset PE8
	pop {r7,pc}					@; return to caller
	
	.text
	.global GreenLED_ON
	.thumb_func
GreenLED_ON: @;turn 'L476 Discovery board's green LED off (GPIOE PE8 => 0) 
	push {r7,lr}
	mov_imm32 r3,GPIOE_BASE		@;r3= GPIOE struct address
	mov r2,#(1<<(PE8))			@;r2= BR8 (see RM0351 Table 39. GPIO register map)
	str r2,[r3,#BSRR]			@;reset PE8
	pop {r7,pc}					@; return to caller

	
/* obsolete	
	.global togglePE8
	.thumb_func
togglePE8: @;flip PE8 to its opposite state
	ldr r3,=GPIOE_BASE			@;load GPIOE struct address
	ldr r2,[r3,#IDR]			@;get current port values
	eor r2,r2,#(1<<(PE8))		@;toggle port bit 
	str r2,[r3,#ODR]			@;update port values
	bx lr						@; return to caller
*/

