@; stm32L476Disco_RedLED.S wmh 2019-09-16 : drivers for red LED at PB2 on STM32L476 Discovery  board
@; adds void-void functions RedLED_ON() and RedLED_OFF(), RedLED_toggle, RedLED_INIT() 
@; uppercase 'S' file extension tells GCC to use preprocessor to interpret '#define' definitions 

	@;useful macro
	.macro MOV_imm32 reg, constant
		movw \reg, #:lower16:\constant
		movt \reg, #:upper16:\constant
	.endm


	@;constants derived from those defined in the STM32L476 manual (RM0351, en.DM00083560.pdf)
	.equ	RCC_BASE,0x40021000 	@;origin of RCC register struct (pg 78 of the manual)
	.equ 	RCC_AHB2ENR,0x4C		@;GPIOB peripheral clock enable register (pg 280 of the manual)
	.equ	GPIOBEN,1				@;GPIOB peripheral clock enable bit (pg 280 of the manual)

	.equ	GPIOB_BASE,0x48000400	@;origin of GPIOB register struct (pg 77 of the manual)
	.equ	MODER,	0x00			@;GPIOB configuration register offsets (pg 311 of the manual)      
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
	.equ	PB2,	2				@; bit number 2 of GPIOB
	
	.syntax unified				@; ARM Unified Assembler Language (UAL) is allowed 
	.thumb						@; we're using thumb instructions only

	.text						
	.align 2

	.global RedLED_init
	.thumb_func
RedLED_init: @;configure port bit PB2 as GPIO output with high-speed push/pull drivers and no pu/pd. 
	push {r7,lr}
	@; set port enable bit (pg 251 of the manual)
	mov_imm32 r3,RCC_BASE		@;load RCC struct address
	ldr r2,[r3,#RCC_AHB2ENR]	@;get current values of device enables
	orr r2,#(1<<GPIOBEN)		@;enable port
	str r2,[r3,#RCC_AHB2ENR]	@; ..
	
	@; configure as an output (pg 303 of the manual)
	mov_imm32 r3,GPIOB_BASE		@;load GPIOB struct address
	ldr r2,[r3,#MODER]			@;get current mode values of port
	bic r2,#(3<<(2*PB2))		@;clear current mode value of port bit
	orr	r2,#(1<<(2*PB2))		@;set new mode value of port bit to general purpose output
	str r2,[r3,#MODER]			@; ..
	
	@; configure output as push/pull (pg 304 of the manual)
	ldr r2,[r3,#OTYPER]			@;get current push/pull settings of port
	bic r2,#(1<<(1*PB2))		@;clear current control value of port bit (=push/pull) 
	str r2,[r3,#OTYPER]			@; ..

	@; configure output as high speed (pg 304 of the manual)
	ldr r2,[r3,#OSPEEDR]		@;get current speed values of port
	bic r2,#(3<<(2*PB2))		@;clear current speed value of port bit
	orr	r2,#(2<<(2*PB2))		@;set new speed of port bit as high speed
	str r2,[r3,#OSPEEDR]		@; ..

	@; configure output as no pullup, pulldown
	ldr r2,[r3,#OPUPDR]			@;get current pu/pd settings of port
	bic r2,#(3<<(2*PB2))		@;clear current pupd value of port bit (=no pu/pd)
	str r2,[r3,#OPUPDR]			@; ..

	pop {r7,pc}					@; return to caller


	.global RedLED_OFF
	.thumb_func
RedLED_OFF: @;turn 'L476 Discovery board's red LED off (GBIOB PB2 => 0) 
	push {r7,lr}
	mov_imm32 r3,GPIOB_BASE		@;r3= GBIOB struct address
	mov r2,#(1<<(16+PB2))		@;r2= BR8 (see RM0351 Table 39. GPIO register map)
	str r2,[r3,#BSRR]			@;reset PB2
	pop {r7,pc}					@; return to caller
	

	.global RedLED_ON
	.thumb_func
RedLED_ON: @;turn 'L476 Discovery board's red LED off (GBIOB PB2 => 1) 
	push {r7,lr}
	mov_imm32 r3,GPIOB_BASE		@;r3= GBIOB struct address
	mov r2,#(1<<(PB2))			@;r2= BR8 (see RM0351 Table 39. GPIO register map)
	str r2,[r3,#BSRR]			@;set PB2
	pop {r7,pc}					@; return to caller

	.global RedLED_toggle
	.thumb_func
RedLED_toggle: @;flip PB2 to its opposite state
	ldr r3,=GPIOB_BASE			@;load GBIOB struct address
	ldr r2,[r3,#IDR]			@;get current port values
	eor r2,r2,#(1<<(PB2))		@;toggle port bit 
	str r2,[r3,#ODR]			@;update port values
	bx lr						@; return to caller


