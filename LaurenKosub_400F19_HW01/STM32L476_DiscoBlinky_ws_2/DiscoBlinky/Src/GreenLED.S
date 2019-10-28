@; GreenLED.S wmh 2019-08-21 : functions initializing and controlling the green LED at port pin PE8 on the STM32L476 Discovery board
@; uppercase 'S' file extension tells GCC to use preprocessor to interpret '#define' definitions 

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
	.global initGPIOE8
	.thumb_func
initGPIOE8: @;configure port bit PE8 as GPIO output with high-speed push/pull drivers and no pu/pd. 
	@; set port enable bit (pg 251 of the manual)
	ldr r3,=RCC_BASE			@;load RCC struct address
	ldr r2,[r3,#RCC_AHB2ENR]	@;get current values of device enables
	orr r2,#(1<<GPIOEEN)		@;enable port
	str r2,[r3,#RCC_AHB2ENR]	@; ..
	
	@; configure as an output (pg 303 of the manual)
	ldr r3,=GPIOE_BASE			@;load GPIOE struct address
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

	bx lr						@; return to caller

	
	.global togglePE8
	.thumb_func
togglePE8: @;flip PE8 to its opposite state
	ldr r3,=GPIOE_BASE			@;load GPIOE struct address
	ldr r2,[r3,#IDR]			@;get current port values
	eor r2,r2,#(1<<(1*PE8))		@;toggle port bit 
	str r2,[r3,#ODR]			@;update port values
	
	bx lr						@; return to caller
