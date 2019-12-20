@; stm32fL476xx_TIMx_demo05.S wmh 2019-11-02 : setup TIMx as basic timer to trigger conversion in ADC1 at 1Hz; working for TIM5
@; currently configured for use with 4MHz HSI/APB1 by setting prescalar = 3 on line to give 1 MHz couner clock. 
@; stm32L476xx_TIMx_demo05.S wmh 2017-10-20 : adds CCR1 ramp update to TIMx_IRQHandler
@; stm32L476xx_TIMx_demo04.S wmh 2017-10-18 : updated for MoTdevice_TIMxPWM
@; stm32L476xx_TIMx_demo03.S wmh 2017-10-18 : updated for 'L476 -- working
@; --- characterize target syntax, processor
	.syntax unified				@; ARM Unified Assembler Language (UAL). 
	.thumb						@; but here we'll use thumb instructions only

	.equ 	TIM5_BASE,			0x40000C00	@; origin of TIM5 control register array
	.equ	TIMx_PSCoffset,		0x28		@;HCLK divider (16 bits)  
	.equ	TIMx_ARRoffset,		0x2C		@;max count; 16 bits for TIM3,-4,-6,-7; 32 bits for TIM2,-5
	.equ	TIMx_EGRoffset,		0x14		@;event generation register (write only)
	.equ	TIMx_CR1offset,		0x00		@;control register (read/write)
	.equ	TIMx_SRoffset,		0x10		@;status register bits are rc_w0
	.equ	TIM5_PSCvalue,		47			@;with HCLK=48MHz, gives 1MHz output
	.equ	TIM5_ARRvalue,		999999		@;with HCLK=48MHz, PSC=47 gives 1Hz output
			

	.equ	RCC_BASE,           0x40021000	@; 	
	.equ 	RCC_APB1RSTR1offset,0x38		@;for any of TIM2-TIM7 
	.equ    RCC_APB1ENR1offset,	0x58		@; ""
	.equ 	TIMx_RSTmask,		0x1			@; ..
	.equ	TIMx_ENmask,		0x1			@;
	.equ 	TIMx_RSTval,		0x1			@; ..
	.equ	TIMx_ENval,			0x1			@;
	.equ	TIM2_RSTshift,		0			@;for specific timer
	.equ	TIM3_RSTshuft,		1			@; ""
	.equ	TIM4_RSTshift,		2			@; ""
	.equ	TIM5_RSTshift,		3			@; ""
	.equ	TIM6_RSTshift,		4			@; ""
	.equ	TIM7_RSTshift,		5			@; ""
	.equ	TIM2_ENshift,		0			@;for specific timer
	.equ	TIM3_ENshift,		1			@; ""
	.equ	TIM4_ENshift,		2			@; ""
	.equ	TIM5_ENshift,		3			@; ""
	.equ	TIM6_ENshift,		4			@; ""
	.equ	TIM7_ENshift,		5			@; ""

	.macro MOV_imm32 reg, constant
		movw \reg, #:lower16:\constant
		movt \reg, #:upper16:\constant
	.endm

	.macro	UPDATEBITS structbase, regoffset, bitshift, bitmask, bitval	@;new bitmask/bitval must fall within (0xFF<<shift) shifted bit pattern
		MOV_imm32 r3,(\structbase)
		ldr r2,[r3,#(\regoffset)]
		bic r2,#((\bitmask)<<(\bitshift))
		orr r2,#((\bitval)<<(\bitshift))
		str r2,[r3,#(\regoffset)]
	.endm

	.macro	UPDATEWORD structbase, regoffset, mask32, value32
		MOV_imm32 r3,(\structbase)
		ldr r2,[r3,#(\regoffset)]
		MOV_imm32 r1,(\mask32)				@;32-bit pattern of bits to be replaced (=1) and bits to be left as-is (=0)
		bic r2,r1
		MOV_imm32 r1,(\value32)				@;32-bit pattern of bits to be set (=1) and bits to be cleared (=0)
		orr r2,r1
		str r2,[r3,#(\regoffset)]
	.endm
	
	
	.macro WRITE16 structbase, regoffset,value16
		MOV_imm32 r3,(\structbase)
		movw r2,(\value16)
		strh r2,[r3,#(\regoffset)]
	.endm
	
	.macro WRITE32 structbase, regoffset,value32
		MOV_imm32 r3,(\structbase)
		MOV_imm32 r2,(\value32)
		str r2,[r3,#(\regoffset)]
	.endm
	

@; --- TIM5 basic timer
	.text						
	.align 2

/*
@; functions to freeze/unfreeze TIMx; derived from macros in stm32f7xx_hal.h 
@; --- definitions for DBGMCU control of TIMx (from STM32L476xx.h)
.equ    DBGMCU_BASE,    0xE0042000  @; Debug MCU registers base address 
.equ	APB1FZ,	0x08	@;	   __IO uint32_t APB1FZ;  // < Debug MCU APB1 freeze register,   Address offset: 0x08 
//.equ    DBGMCU_APB1_FZ_DBG_TIMx_STOP_Pos,  0x0   @;position of bit in APB1FZ; setting this bit will cause TIMx to 'freeze' when CPU stops at breakpoints

	.global DBGMCU_FREEZE_TIMx
	.thumb_func
DBGMCU_FREEZE_TIMx:	@;freeze TIMx when stopped in debug mode
	ldr r3,=DBGMCU_BASE @; ..
	ldr r2,[r3,#APB1FZ]	@; ..
    orr r2,#(1<<DBGMCU_APB1_FZ_DBG_TIMx_STOP_Pos) @; ..
	str r2,[r3,#APB1FZ]	@; ..    
    bx lr

	.global DBGMCU_UNFREEZE_TIMx
	.thumb_func
DBGMCU_UNFREEZE_TIMx:	@;unfreeze TIMx in debug mode
	ldr r3,=DBGMCU_BASE @; ..
	ldr r2,[r3,#APB1FZ]	@; ..
    bic r2,#(1<<DBGMCU_APB1_FZ_DBG_TIMx_STOP_Pos) @; ..
	str r2,[r3,#APB1FZ]	@; ..    
    bx lr
*/


	.global TIM5_init
	.thumb_func
TIM5_init:	@;TIMx initialized as a simple upcounter  
    push {r7,lr}

	@;enable the timer
	UPDATEBITS RCC_BASE,RCC_APB1ENR1offset,TIM5_ENshift,TIMx_ENmask,1
	movw r0,0x1234	@;delay to let enable take effect
1:	subs r0,1		@; ..
	bne 1b			@; ..

	@;assert reset to the timer
	UPDATEBITS RCC_BASE,RCC_APB1RSTR1offset,TIM5_RSTshift,TIMx_RSTmask,1
	movw r0,0x1234	@;delay to let enable take effect
1:	subs r0,1		@; ..
	bne 1b			@; ..

	@;deassert reset 
	UPDATEBITS RCC_BASE,RCC_APB1RSTR1offset,TIM5_RSTshift,TIMx_RSTmask,0
	movw r0,0x1234	@;delay to let enable take effect
1:	subs r0,1		@; ..
	bne 1b			@; ..

 	@;set TIM5 prescaler reload value
	WRITE16 TIM5_BASE,TIMx_PSCoffset,TIM5_PSCvalue			

	@;set TIM5 counter reload value
	WRITE32 TIM5_BASE,TIMx_ARRoffset,TIM5_ARRvalue			
	
	@;generate a software update event to write preload values to ARR
	WRITE16 TIM5_BASE,TIMx_EGRoffset,(1<<0)					@; set TIMx_EGR UIF	(bits are write-only

	@;enable TIMx as up-counting edge-aligned overflow-triggered repeating counter
	UPDATEBITS TIM5_BASE,TIMx_CR1offset,0,(1<<0),(1<<0)		@; set TIMx_CR1 CEN, leave everything else at reset default values	
	@;!! here with all CCxIF flags in SR =1 as a side effect of the above instruction
	
	@;clear all TIMx interrupt flags
@;	UPDATEWORD TIM5_BASE,TIMx_SR,(1<<12|1<<11|1<<10|1<<9|1<<6|1<<4|1<<3|1<<2|1<<1|1<<0),0
	UPDATEWORD TIM5_BASE,TIMx_SRoffset,((0xF<<9)|(1<<6)|(0x1F<<0)),0	@;clear all flags in SR, leave reserved values as-is
		
	@; here with TIM5 running
	pop {r7,pc}

