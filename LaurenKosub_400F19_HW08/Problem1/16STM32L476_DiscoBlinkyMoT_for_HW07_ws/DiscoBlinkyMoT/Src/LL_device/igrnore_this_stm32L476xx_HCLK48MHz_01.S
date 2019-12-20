@;stm32L476xx_HCLK48MHz_01.S wmh 2019-10-21 : implement function 'int stm32L476xx_HCLK48MHz()' //sets HCLK to 48MHz -- working
@; - we're basing the clock on the cefault 4 MHz MSI oscillator which is our current clock source
@; - this 12x increase will increase our USART2 baud rate to 15200 (desireable) but TIM2 will have to be adjusted. 

@; --- characterize target syntax, processor
	.syntax unified				@; ARM Unified Assembler Language (UAL). 
	.thumb						@; but here we'll use thumb instructions only
 	
	.macro MOV_imm32 reg, constant
		movw \reg, #:lower16:\constant
		movt \reg, #:upper16:\constant
	.endm

	@;registers affected
	.equ PWR_ORIGIN,			0x40007000
	.equ PWR_CR1,				0x00

	.equ RCC_ORIGIN,			0x40021000	
	.equ RCC_CR, 				0x00	@;	MSIRANGE[3:0]
	.equ RCC_ICSCR,				0x04	@;	my MSICAL=0x84 	at startup
	.equ RCC_PLLCFGR, 			0x0C
	.equ RCC_CFGR,				0x08
	.equ RCC_APB1ENR1,			0x58
	.equ RCC_BDCR,				0x90
@	.equ RCC_CIR_offset,			
@	.equ FLASH_ACR,				0x40023C00


	.text
	
	.global LSE_init 
	.thumb_func
LSE_init:	@; void LSE_init();
	push {r7,lr}
/*
	From RM0351:
	The bits of the Backup domain control register (RCC_BDCR) are outside of the VCORE
	domain. As a result, after Reset, these bits are write-protected and the DBP bit in the
	Section 5.4.1: Power control register 1 (PWR_CR1) has to be set before these can be
	modified. Refer to Section 5.1.5: Battery backup domain on page 156 for further info. 
*/
	@;enable changes to PWR
	MOV_imm32 r3,RCC_ORIGIN		@;see pg 157 in RM0351 : "Backup domain access"
	ldr r2,[r3,#RCC_APB1ENR1]	@; set PWREN				
	orr r2,#(1<<28)				@; ..
	str r2,[r3,#RCC_APB1ENR1]	@; ..	
	@;enable changes to LSE
	MOV_imm32 r3,PWR_ORIGIN		@;set DBP in PWR_CR1
	ldr	r2,[r3,#PWR_CR1]		@; ..
	orr	r2,#(1<<8)				@; ..
	str	r2,[r3,#PWR_CR1]		@; ..
	@;configure LSE
	MOV_imm32 r3,RCC_ORIGIN		@;increase crystal drive to highest
	ldr r2,[r3,#RCC_BDCR]		@; (note: this will be ineffective if LSE is already enabled)
	orr r2,#(0x3<<3)			@; ..
	str r2,[r3,#RCC_BDCR]		@; LSEDRV = 0x3	
	@;enable LSE
	ldr r2,[r3,#RCC_BDCR]		@; ..
	orr r2,#(1<<0)				@; ..
	str r2,[r3,#RCC_BDCR]		@; LSEON=1	
	@;wait for LSE to start
1: 	ldr r2,[r3,#RCC_BDCR]		@; ..
	tst r2,#(1<<1)				@; LSERDY==1?
	beq 1b						@;	wait some more
	@;here with LSE running
	pop {r7,pc}
	
	
	.global HCLK48MHz_init
	.thumb_func
HCLK48MHz_init:		//int HCLK48MHz_init(); //return 0=SUCCESS, -1=FAIL
	push {r7,lr}

	mov r0,#0					@;report success
	pop {r7,pc}
2:	@;here if unable to change HCLK 
	mov r0,#-1					@;report failure
	pop {r7,pc}