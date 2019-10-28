@; MoT_Comm_stm32L476_USART2_9600N81_01.S : follows decision to integrate messagehandler code with communication channel code
@; 03stm32L476_USART2_9600N81.S wmh 2019-10-13 : continuing work on rx and tx interrupt versions 
@; 02stm32L476_USART2_9600N81.S wmh 2019-10-12 : interrupt version for use with MoT bufbuf
@; stm32L476Disco_USART2_9600N81.S wmh 2019-09-11 : USART2 functions for STM32L476 Discovery board
@;	- STM32L476VG_Discovery_UM1879_user_manual_en.DM00172179.pdf states that the ST-LINK connections are on PD5/PD6
@;  - STM32L476_manual_(RM0351)_en.DM00083560.pdf alternate function maps says USART2_TX/USART2_RX are AF7 of PD5/PD6

/* functions defined here/prototypes for C
	void USART2_init(void); 			//initialize USART2 for asynchronous 9600N81 communication
	int USART2_nbgetchar(void);			//non-blocking; success: return data>=0; failure: return -1
	int USART2_nbputchar(char c);		//non-blocking; success: return +1; failure: return -1
	int USART2_bgetchar(void);			//blocks until new data, then return data
	void USART2_bputchar(char c);		//block until character can be sent
	void USART2_writeDR(char c);		//for debug: unconditional write to USART2 DR and return
*/

	@; --- characterize target syntax, processor
	.syntax unified				@; ARM Unified Assembler Language (UAL). 
	.thumb						@; Use thumb instructions only

/*	
	@;useful macro
	.macro MOV_imm32 reg, constant
		movw \reg, #:lower16:\constant
		movt \reg, #:upper16:\constant
	.endm
*/
	#define __ASSEMBLY__
	#include "MoT_definitions.h"


	
@;STM32L4xx USART2 definitions

@; STM32L476xx RCC registers controlling clock enables and USART2 clock source -- from RM0351 (en.DM00083560.pdf)
	.equ 	RCC_BASE,0x40021000
	.equ 	RCC_APB1ENR1,0x58
	.equ 	RCC_APB1RSTR1,0x38
	.equ 	RCC_AHB2ENR,0x4C 
	.equ 	RCC_CCIPR,0x88
	.equ 	RCC_CFGR,0x08

@; info: RCC registers controlling clock enables and USART2 clock source
@; must do
@; 	RCC_APB1ENR1[17]	USART2EN 		: USART2 clock enable
@;	RCC_APB1RSTR1[17]	USART2RST		: USART2 reset
@; 	RCC_AHB2ENR[3] 		GPIODEN 		: IO port D clock enable
@; can skip when using reset configuration
@; 	RCC_CCIPR[3:2]		USART2SEL[1:0]	: USART2 clock source selection; 00: PCLK select as USART2 clock source (reset value)
@; 	RCC_CFGR[13:11] 	PPRE2[2:0]		: APB high-speed prescaler (APB2); 0xx: HCLK not divided (reset value)
@; 	RCC_CFGR[10:8] 		PPRE1[2:0]		: APB low-speed prescaler (APB1); 0xx: HCLK not divided (reset value)
@; 	RCC_CFGR[7:4] 		HPRE[3:0]		: AHB prescaler; 0xxx: SYSCLK not divided (reset value)
@;
@; info: RM0351 Figure 15 'Clock tree (for STM32L475xx/476xx/486xx devices)' shows clock paths to USART2
@;  Our stripped-down startup 'startup_stm32l476xx.S' does no clock initializations, so we are operating 
@;  off reset defaults, then input to USART2 baud generator = PCLK (=APB1 clk (= HCLK ( = SYSCLK (= MSI clock (= 4 MHZ)))))  
 
@; --- NVIC register array base addresses
	.equ	NVIC_ISER,	0xE000E100	@; Interrupt Set-Enable Registers, NVIC_ISER0-NVIC_ISER15
	.equ	NVIC_ICER,	0xE000E180	@; Interrupt Clear-Enable Registers, NVIC_ICER0-NVIC_ICER15
	.equ	NVIC_ISPR,	0xE000E200	@; Interrupt Set-Pending Registers, NVIC_ISPR0-NVIC_ISPR15
	.equ	NVIC_ICPR,	0xE000E280	@; Interrupt CLR-Pending Registers, NVIC_ICPR0-NVIC_ICPR15
	.equ 	NVIC_IABR,	0xE000E300	@; Interrupt Active Bit Registers, NVIC_IABR0-NVIC_IABR15
	.equ 	NVIC_IPR,	0xE000E400	@; Interrupt Priority Registers, NVIC_IPR0-NVIC_IPR123

@; --- USART2 offsets in NVIC	
	.equ USART2_NVICbitoffset,38 	@;^^ USART2's 'position' in vector table from RM0351 Table 57. 
	.equ USART2_NVICwordoffset,1	@;^^ of words from origin to word holding bit 'position', for any of the NVIC word-registers
	.equ USART2_NVICbyteoffset,4	@;^^ of bytes from origin to byte holding priority for any of the NVIC byte-registers

@; --- USART2 receive ringbuffer size
	.equ USART2_RXBUFSIZE,2500	@;!TODO make this a configuration value

@; --- global data memory
	.data						@;following are located in .data so standard C startup protocol initializes critical values (TODO?)

	@;control and data structure of USART receive interrupt
	.align 2	@;put data on word-boundary
USART2_RXbufStruct:
	.skip 32					@;buffer control and status struct -- see MoT_definitions.h
	.global USART2_RXbufHANDLE 	@;make visible in debugger and main()
USART2_RXbufHANDLE:				@;buffer 'handle' which is passed to buffer management functions; positive/negative offsets from handle give access to data/buffer control 
	.skip USART2_RXBUFSIZE		@;buffer data

	.align 2		@;put data on word-boundary
	.global USART2_MsgCtl, admin_Msgctl @;
USART2_MsgCtl: 	@; 'USART2_MsgCtl' holds head and tail pointers to the data of a list of tasks which have posted messages to be sent out USART2
admin_Msgctl:	@; alias of USART2_MsgCtl
	.skip 8		@; allocation for 'Msgctl' entries MSGHEAD_PTR and MSGTAIL_PTR 
 
 

@; --- begin code memory
	.text						@;start the code section

    .global configure_GPIOD_for_USART2	@;set up PD5,PD6 for USART2 operation
    .thumb_func
configure_GPIOD_for_USART2: 
@; stm32L476 register struct offset for GPIOD (from RM0351)
	.equ GPIOD_BASE, 0x48000C00		
@; offsets in GPIO register struct extracted from GPIO_TypeDef in stm32L476xx.h
@; struct offset definitions are made local to code which uses them to avoid conflicts with same names in other structs
	.equ	MODER,	0x00	@;  GPIO port mode register,	Address offset:	0x00	      
	.equ	OTYPER,	0x04	@;  GPIO port output type register,	Address offset:	0x04	      
	.equ	OSPEEDR,0x08	@;  GPIO port output speed register,	Address offset:	0x08	      
	.equ	PUPDR,	0x0C	@;  GPIO port pull-up/pull-down register,	Address offset:	0x0C	      
	.equ	IDR,	0x10	@;  GPIO port input data register,	Address offset:	0x10	      
	.equ	ODR,	0x14	@;  GPIO port output data register,	Address offset:	0x14	      
	.equ	BSRR,	0x18	@;  GPIO port bit set/reset register,	Address offset:	0x18	      
	.equ	LCKR,	0x1C	@;  GPIO port configuration lock register,	Address offset:	0x1C	      
	.equ	AFRL,	0x20	@;  GPIO alternate function register low,	Address offset:	0x20
	.equ	AFRH,	0x24	@;  GPIO alternate function register high,	Address offset:	0x24 
	.equ	BRR,	0x28	@;  GPIO Bit Reset register,               Address offset: 0x28     
	.equ	ASCR,	0x2C	@;  GPIO analog switch control register,   Address offset: 0x2C    

	.equ	PD5,	5		@; 	bit number 5 of GPIOD
	.equ	PD6,	6		@; 	bit number 6 of GPIOD
	
	push {r7,lr}

	@;(re-)enable GPIOD 
	MOV_imm32 r3,RCC_BASE	@; select RCC AHB2 peripheral clock register
	ldr r2,[r3,#RCC_AHB2ENR]@; ..
	orr	r2,r2,(1<<3)		@; enable GPIOD
	str r2,[r3,#RCC_AHB2ENR]@; ..

    @;configure GPIOD PD5/PD6 for alternate function USART2_TX/USART2_RX
    MOV_imm32 r3,GPIOD_BASE	@;select GPIOD for register operations
	@;configure PD5,PD6 for alternate function
	ldr r2,[r3,#(MODER)]
    bic r2,#(0x03<<(2*PD5))	@;clear mode bits
   	bic r2,#(0x03<<(2*PD6))	@; ..
	orr r2,#(0x02<<(2*PD5))	@;make alternate function
	orr r2,#(0x02<<(2*PD6))	@; .. 	
	str r2,[r3,#(MODER)]

	@;configure PD5 output as push-pull  !!comment this and following out to check whether necessary
	ldr r2,[r3,#(OTYPER)]
    bic r2,#(0x1<<PD5)		@;clear type bit
	str r2,[r3,#(OTYPER)]

	@;configure PD5 as high-speed output
	ldr r2,[r3,#(OSPEEDR)]
    bic r2,#(0x3<<(2*PD5))	@;clear speed bits
	orr r2,#(0x2<<(2*PD5))	@;make high speed
	str r2,[r3,#(OSPEEDR)]

	@;no pullup/pulldown on PD5 
	ldr r2,[r3,#(PUPDR)]
    bic r2,#(0x3<<(2*PD5))	@;clear PUPD type bits (no pu/pd) 
	str r2,[r3,#(PUPDR)]
	
	@;connect PD5 alternate function 7= USART2_TX
	ldr r2,[r3,#(AFRL)]
    bic r2,#(0xF<<(4*PD5))	@;clear alternate function bits
	orr r2,#(0x7<<(4*PD5))	@; set alternate function code
	str r2,[r3,#(AFRL)]

	@;configure PD6 output type -- skipped. Its an input

	@;configure PD6 output speed -- skipped. Its an input

	@; configure pullup on PD6 to set default input =1 (= 'mark') if not connected 
	ldr r2,[r3,#(PUPDR)]
    bic r2,#(0x3<<(2*PD6))	@;clear PUPD type bits
	orr r2,#(0x1<<(2*PD6))	@;configure as pullup
	str r2,[r3,#(PUPDR)]
	
	@;connect PD6 alternate function 7= USART2_RX
	ldr r2,[r3,#(AFRL)]
    bic r2,#(0xF<<(4*PD6))	@;clear alternate function bits
	orr r2,#(0x7<<(4*PD6))	@; set alternate function code
	str r2,[r3,#(AFRL)]

	@;here with GPIOD configured to connect USART2
	pop {r7,pc}

	
	

	.global USART2_init, adminTether_init 	@;initialize USART2 for asynchronous 9600N81 communication
	.thumb_func
USART2_init: 
	.thumb_func
adminTether_init:	@;alias of USART2_init
@; stm32L476 register struct offset for USART2 (from RM0351)
	.equ USART2_BASE,0x40004400		@;stm32L476	
@; offsets in USART register struct extracted from USART_TypeDef in stm32L476xx.h and edited via spreadsheet
@; struct offset definitions are made local to code which uses them to avoid conflicts with same names in other structs 
	.equ CR1, 0x00   	@   __IO uint32_t CR1;  	/*!< USART Control register 1,                 Address offset: 0x00 */
	.equ CR2, 0x04   	@   __IO uint32_t CR2;  	/*!< USART Control register 2,                 Address offset: 0x04 */
	.equ CR3, 0x08   	@   __IO uint32_t CR3;  	/*!< USART Control register 3,                 Address offset: 0x08 */
	.equ BRR, 0x0C   	@   __IO uint32_t BRR;  	/*!< USART Baud rate register,                 Address offset: 0x0C */
	.equ GTPR, 0x10   	@   __IO uint16_t GTPR;  	/*!< USART Guard time and prescaler register,  Address offset: 0x10 */
	.equ RVED2, 0x12   	@   uint16_t  RESE RVED2;   /*!< Reserved, 0x12 0x12 */
	.equ RTOR, 0x14   	@   __IO uint32_t RTOR;  	/*!< USART Receiver Time Out register,         Address offset: 0x14 */
	.equ RQR, 0x18   	@   __IO uint16_t RQR;  	/*!< USART Request register,                   Address offset: 0x18 */
	.equ RVED3, 0x1A   	@   uint16_t  RESE RVED3;   /*!< Reserved, 0x1A 0x1A */
	.equ ISR, 0x1C   	@   __IO uint32_t ISR;  	/*!< USART Interrupt and status register,      Address offset: 0x1C */
	.equ ICR, 0x20   	@   __IO uint32_t ICR;  	/*!< USART Interrupt flag Clear register,      Address offset: 0x20 */
	.equ RDR, 0x24   	@   __IO uint16_t RDR;  	/*!< USART Receive Data register,              Address offset: 0x24 */
	.equ RVED4, 0x26   	@   uint16_t  RESE RVED4;   /*!< Reserved, 0x26 0x26 */
	.equ TDR, 0x28   	@   __IO uint16_t TDR;  	/*!< USART Transmit Data register,             Address offset: 0x28 */
	.equ RVED5, 0x2A   	@   uint16_t  RESE RVED5;   /*!< Reserved, 0x2A 0x2A */

  	push {r7,lr}

	@; USART2 clock enable -- (re-)enable USART2 
	MOV_imm32 r3,RCC_BASE		@; select RCC APB1 peripheral clock register
	ldr r2,[r3,#RCC_APB1ENR1]	@; ..
	orr	r2,#(1<<17)				@; set USART2EN 
	str r2,[r3,#RCC_APB1ENR1]	@; ..


	@; USART2 reset -- reset USART2 to start off clean
	MOV_imm32 r3,RCC_BASE		@; ..
	ldr r2,[r3,#RCC_APB1RSTR1]	@; ..
	orr	r2,#(1<<17)				@; set USART2_RST 
	str r2,[r3,#RCC_APB1RSTR1]	@; 
	nop							@; give it time to work (unnecessary?)
	nop							@; ..
	nop							@; ..
	nop							@; ..
	bic	r2,r2,#(1<<17)			@; clear USART2_RST to end reset
	str r2,[r3,#RCC_APB1RSTR1]	@; 

@; --- configure USART2
/*
info: RM0351 Figure 15 'Clock tree (for STM32L475xx/476xx/486xx devices)' shows clock paths to USART2
	Our stripped-down startup 'startup_stm32l476xx.S' does no clock initializations, so we are operating 
	off reset defaults, hence MSI clock = SYSCLK = HCLK = APB1 clock = USART2 clk input = 4MHz  
	
step-by-step USART configuration procedure described in RM0351 pg 1341 (TX) and 1344 (RX)
	1. Program the M bits in USART_CR1 to define the word length.
	2. Select the desired baud rate using the USART_BRR register.
	3. Program the number of stop bits in USART_CR2.
	4. Enable the USART by writing the UE bit in USART_CR1 register to 1.
	5. (TX) Select DMA enable (DMAT) in USART_CR3 if multibuffer communication is to take
	place. Configure the DMA register as explained in multibuffer communication.
	5'. (RX) Select DMA enable (DMAR) in USART_CR3 if multibuffer communication is to take
	place. Configure the DMA register as explained in multibuffer communication.
	6. (TX) Set the TE bit in USART_CR1 to send an idle frame as first transmission.
	6'. (RX) Set the RE bit USART_CR1. This enables the receiver which begins searching for a
	start bit.
	7. Write the data to send in the USART_TDR register (this clears the TXE bit). Repeat this
	for each data to be transmitted in case of single buffer.
	8. After writing the last data into the USART_TDR register, wait until TC=1. This indicates
	that the transmission of the last frame is complete. This is required for instance when
	the USART is disabled or enters the Halt mode to avoid corrupting the last
	transmission. 
*/

	MOV_imm32 r3,USART2_BASE

@; step 0 (added): disable the USART by writing the UE bit in USART_CR1 register to 0 (necessary to change M1, M0)
	ldr r2,[r3,#CR1]
	bic r2,#(1<<0) 		@;UE=0 
	str r2,[r3,#CR1]

@; step 1: Program the M bits in USART_CR1 to define the character protocol  
	ldr r2,[r3,#CR1]
	bic r2,#(1<<12) 	@;M0=0 
	bic r2,#(1<<28) 	@;M1=0 
	str r2,[r3,#CR1] 	@;[M1:M0]= [0:0] -> 1 Start bit, 8 data bits, n stop bits

@;	step 4. Enable the USART by writing the UE bit in USART_CR1 register to 1.	
	ldr r2,[r3,#CR1]
	orr r2,#(1<<0) 		@;UE=1 
	str r2,[r3,#CR1]

@; step 2: Select the desired baud rate using the USART_BRR register.
	movw r2,#:lower16:(417)	@;  target baud: 9600; fPCLK=4MHZ; OVER8=0 => USARTDIV = 4000000/9600 =  416.666
	strh r2,[r3,#BRR]		@;

@; step 3. Program the number of stop bits in USART_CR2.
	ldr r2,[r3,#CR2]
	bic r2,#(0x3<<12) 	@;STOP=00 (1 stop bit)
	str r2,[r3,#CR2]
/*
@;	step 4. Enable the USART by writing the UE bit in USART_CR1 register to 1.	
	ldr r2,[r3,#CR1]
	orr r2,#(1<<0) 		@;UE=1 
	str r2,[r3,#CR1]
*/	
@;	step 5. Select DMA enable (DMAT) in USART_CR3 if multibuffer communication is to take place. 
	ldr r2,[r3,#CR3]
	bic r2,#(1<<7)		@;DMAT = 0 so no transmit DMA
	str r2,[r3,#CR3]

@;	setp 5'. Select DMA enable (DMAR) in USART_CR3 if multibuffer communication is to take place.
	ldr r2,[r3,#CR3]
	bic r2,#(1<<6)		@;DMAr = 0 so no receive DMA
	str r2,[r3,#CR3]
		
@;	step 6. Set the TE bit in USART_CR1 to send an idle frame as first transmission.
	ldr r2,[r3,#CR1]
	orr r2,#(1<<3) 		@; TE=1 (transmitter enable , "sends a preamble (idle line)"? Sends 'MARK'?)
	str r2,[r3,#CR1]

@;	step 6'
	ldr r2,[r3,#CR1]
	orr r2,#(1<<2) 		@; RE=1 (receiver enable) 
	str r2,[r3,#CR1]
	
	@;GPIO settings
	bl configure_GPIOD_for_USART2

	@;NVIC settings
	bl USART2_IRQinit
	
	pop {r7,pc}

	.global USART2_nbgetchar @;conditional USART2 getchar()
	.thumb_func
USART2_nbgetchar: @; char USART2_nbgetchar(void);	//success: return data>=0; failure: return -1
 	push {r7,lr}
	MOV_imm32 r3,USART2_BASE	

	@;initialize success/fail to 'fail'
	mov r0,#-1		
	@;check if new data is available
	ldr r2,[r3,#ISR]			@;is receiver not empty (RXNE ==1)?
	tst r2,#(1<<5)				@; ..
	beq	1f						@;	no, receiver is empty -- return -1 (no data is available)
	ldrb r0,[r3,#RDR]			@;	yes, receiver is not empty -- get new data (automatically clears RXNE)
@;	ands r0,#0xFF				@;	clean it up to 8 bits
@;	strb r0,[r3,#DR]			@;  echo it back for debug
1:	pop {r7,pc}					@; 	and return ( data>=0 =='success' )

	.global USART2_nbputchar		@;conditional USART2 putchar()
	.thumb_func
USART2_nbputchar: @;  int USART2_nbputchar(char data);	//success: return +1; failure: return -1
 	push {r7,lr}
	MOV_imm32 r3,USART2_BASE	

	@;check if sending is ok
	ldr r2,[r3,#ISR]			@;is transmitter empty (TXE ==1)?
	tst r2,#(1<<7)				@; .. 
	beq 1f						@;	no, transmitter not empty -- return -1 (sending is blocked)
	strb r0,[r3,#TDR]			@;	yes -- send data (automatically clears TXE)
	mov r0,#1					@;		mark 'success'
	pop {r7,pc}					@; 		and return +1 (data was sent)
1:	mov r0,#-1					@;mark 'failure'
	pop {r7,pc}					@; 		and return -1 (sending is blocked)
	

	.global USART2_bgetchar		@; blocking USART2 getchar()
	.thumb_func
USART2_bgetchar: @;  int USART2_bgetchar(void);	//blocks until new data, then return data in r0
 	push {r7,lr}
	MOV_imm32 r3,USART2_BASE	

	@;check if new data is available
1:	ldr r2,[r3,#ISR]			@;is receiver not empty (RXNE ==1)?
	tst r2,#(1<<5)				@; ..
	beq	1b						@;	no, receiver is empty -- keep testing
	ldrb r0,[r3,#RDR]			@;	yes, receiver is not empty -- get new data (automatically clears RXNE)
@;	ands r0,#0xFF				@;	clean it up to 8 bits
	pop {r7,pc}					@; 	and return ( data>=0 =='success' )


	.global USART2_bputchar		@;blocking USART2 putchar()
	.thumb_func
USART2_bputchar: @;  void USART2_bputchar(char data);	//block until character can be sent
 	push {r7,lr}
	MOV_imm32 r3,USART2_BASE	

	@;check if sending is ok
1:	ldr r2,[r3,#ISR]			@;is transmitter empty (TXE ==1)?
	tst r2,#(1<<7)				@; .. 
	beq 1b						@;	no, transmitter not empty -- keep testing
	strb r0,[r3,#TDR]			@;	yes -- send data (automatically clears TXE)
	pop {r7,pc}					@; 		and return

	.global USART2_writeDR
	.thumb_func
USART2_writeDR:					@; debug: unconditional write to USART2 DR and return
 	push {r7,lr}
	MOV_imm32 r3,USART2_BASE	
	strb r0,[r3,#TDR]			@;	yes -- send data (automatically clears TXE)
	pop {r7,pc}					@; 		and return


	.global USART2_IRQHandler			@;using label from interrupt table
	.thumb_func
USART2_IRQHandler: 	@; entered for both RX and TX interrupts
	push {r7,lr}	@; even though we're an interrupt, we're not a leaf function, so must do this
	@;
	@; get USART structure pointer
	MOV_imm32 r3,USART2_BASE			@; USART2 register structure  !!
	@;read flags to determine source of interrupt		
	ldr r1,[r3,#ISR]					@;USART status in r1
	tst r1,#(0x0F)						@;break on overrun, noise-detected, framing, or parity error
	bne USART2_IRQHandler_error_trap	@;	yes -- 
	tst r1,#(1<<5)	@;testing RXNE		@;new RX data?
	beq USART2_IRQHandler_noRXdata		@;	no -- go check if we need to transmit
	@; here with new received char to save in USART2 RX ringbuffer						
	MOV_imm32 r0,USART2_RXbufHANDLE		@;get USART2 ringbuffer handle
	ldrh r1,[r3,#RDR]					@;read new RX data value							
	bl ringbufbuf_wr					@; save the new character  -- ringbufbuf_wr(uint8_t *bufHANDLE,  uint8_t data ); )
	@;here with new data saved in USART2 RX ringbuffer. No warning if buffer is full; oldest data is overwritten.  
	@;
	pop {r7,pc}							@;done -- if USART2 TX interrupt is enabled and TXE=1 we'll get a followon interrupt that goes to USART2_IRQHandler_noRXdata below

	@;here if source of interrupt is not error or RXNE so could be TXE  
USART2_IRQHandler_noRXdata: @;if TX interrupt and messages not empty, send next character 
	tst r1,#(1<<7)						@;test TXE -- r1 retains image of SR from above
	beq USART2_IRQHandler_unknown_trap	@;we've eliminated all of the possible interrupt sources, so we have a mystery
	
	@;here when ready to send another character (TXE is true).  r3=USART2_BASE still true
	MOV_imm32 r2,USART2_MsgCtl			@;get USART2 TX msg list
	ldr r2,[r2,#(MSGHEAD_PTR)]			@;get pointer to device data structure of first message on list, or NULL if list is empty
	cbz r2,USART2_IRQHandler_TXcompleted@; if list is empty, go turn off transmit interrupt and exit

	@;here if message list is not empty - send another character. On entry r3=USART2_BASE and r2=device data pointer
	ldr r1,[r2,#MSGPTR]					@;get pointer to next message character
	ldrb r0,[r1],#1						@;get next message character and increment message pointer
	strh r0,[r3,#TDR]					@; send the character
	str r1,[r2,#MSGPTR]					@;update record of message pointer
	ldr r1,[r2,#MSGCOUNT]				@;update message count then test if count =0
	subs r1,#1							@; (sets ZF if count reached 0)
	str r1,[r2,#MSGCOUNT]				@; .. 
	bne USART2_IRQHandler_TXcontinues	@; message control is updated but current message is not finished -- return from interrupt

	@;here if current message is completed -- unlink it from lst and get next message (if any) from list. On entry r2 points to device data
	mov r1,#0							@;clear link to next message (if any) on link by setting MSGPTR=0 (MSGCOUNT is already set to 0 in the above)
	str r1,[r2,#MSGPTR]					@; ..

	@;remove msg link of this message from list. On entry r2 points to device data, r1=0; on exit r0 has pointer to next entry on list (if any)
	ldr r0,[r2,#MSGLINK]				@;get address (if exist) of next message in list in r0
	cmp r0,r2							@;check whether current device message is flagged as last on list (points to itself)
	str r1,[r2,#MSGLINK]				@;  then clear (write NULL) to link of current device message to indicate finished
	beq USART2_IRQHandler_TXcompleted	@;if link of message just finished points to itself then message list is empty 

	@;here when another message followed current one on the list -- make follower new first on list. On entry, r0 holds pointer to follower device
	MOV_imm32 r2,USART2_MsgCtl			@;get USART2 TX msg list
	str r0,[r2,#(MSGHEAD_PTR)]			@;make finished message's follower the new first message

USART2_IRQHandler_TXcontinues:			@; current message is not finished or new message is installed on list -- return from interrupt
	pop {r7,pc}														

	@;here if message is completed and no more messages on list. Clear message pointers and turn interrupt off. 
USART2_IRQHandler_TXcompleted:	
	mov r0,#0							@;clear task messages list
	MOV_imm32 r2,USART2_MsgCtl			@; (might be unnecessary/duplicative -- done 'just in case')	
	str r0,[r2,#(MSGHEAD_PTR)]			@; ..
	str r0,[r2,#(MSGTAIL_PTR)]			@; ..
	ldr r0,[r3,#CR1]					@; disable transmit interrupt 
	bic r0,#( (1<<7) ) @; TXEIE=bit7	@; ..
	str r0,[r3,#CR1]					@; .. 
	@;
	pop {r7,pc}							@; return from interrupt

	@;here with SR in r1 when one or more of ORE, NF, FE, PE (overrun, noise, framing or parity) error bits are set
USART2_IRQHandler_error_trap:
	mov r0,0x0F							@;clear error bits 
	str r0,[r3,#ICR]					@; ..
	MOV_imm32 r1,USART2_RXbufHANDLE		@;make a record of this incident
	ldrb r0,[r1,#(RXBUF_NUMERRORS)]		@; ..
	adds r0,#1							@; ..
	strb r0,[r1,#(RXBUF_NUMERRORS)]		@; ..
	pop {r7,pc}							@; return from interrupt
										
USART2_IRQHandler_unknown_trap:	@;kludge 'fix' for debugging question of why we got an interrupt without any flags set. !!?? maybe because the NVIC pending flag is set?
	MOV_imm32 r1,USART2_RXbufHANDLE
	ldrb r0,[r1,#(RXBUF_NUMUNKNOWNS)]
	adds r0,#1
	strb r0,[r1,#(RXBUF_NUMUNKNOWNS)]
	pop {r7,pc}		

USART2_IRQHandler_putchar_failure_trap:
	MOV_imm32 r1,USART2_RXbufHANDLE
	ldrb r0,[r1,#(RXBUF_NUMPUTFAILS)]
	adds r0,#1
	strb r0,[r1,#(RXBUF_NUMPUTFAILS)]
	pop {r7,pc}		

@ --- USART2 interrupt initialization functions

	.global USART2_IRQinit 	@;sets up USART2 interrupt and enables RX interrupt
    .thumb_func
USART2_IRQinit: @; void USART2_IRQinit(void); 
	@; this initializes and enables the receive but does not enable transmit interrupt.  The transmit interrupt will be turned on and off
	@; to modulate packet sending.  

	push {r7,lr}
	
	@;turn off all interrupts
	CPSID i	

	@;initialize USART2 ring buffer control and status; see USART2_RXbufStruct defined above
	bl USART2_RXbuffer_init
	
	@;NVIC: make sure USART2 interrupt enable is off in NVIC before changing things
	ldr r3,=(NVIC_ICER+4*USART2_NVICwordoffset)	
	mov r2,#(1<<(USART2_NVICbitoffset-32*USART2_NVICwordoffset))
	str r2,[r3]

	@;USART: begin update of USART2 configuration
	ldr r3,=USART2_BASE

	@;USART: turn off USART2 error-interrupt enables
	ldr r2,[r3,#CR3]
	bic r2,#(1<<0)	@;clearing EIE (enables fault-interrupts if DMAR is also on -- see ???. "USART interrupt mapping diagram")
	str r2,[r3,#CR3]

	@;USART: clear any error flags that might currently be on (see ??? Status register (USART_ISR) description) 
	mov r0,0x0F							@;clear error bits 
	str r0,[r3,#ICR]					@; ..

	@;NVIC: set USART2 interrupt priority to highest (=0)
	ldr r3,=NVIC_IPR	
	mov r2,#0x00						@;priority is in upper nybble of byte
	strb r2,[r3,#USART2_NVICbyteoffset]	@; byte access is allowed for priority	

	@;NVIC: clear USART2 pending interrupt in NVIC in case something got through previously
	ldr r3,=(NVIC_ICPR+4*USART2_NVICwordoffset)	
	mov r2,#(1<<(USART2_NVICbitoffset-32*USART2_NVICwordoffset)) //!!check this
	str r2,[r3]	//was observed storing ?? at ???; 

	@;NVIC: enable USART2 interrupt
	ldr r3,=(NVIC_ISER+4*USART2_NVICwordoffset)	
	mov r2,#(1<<(USART2_NVICbitoffset-32*USART2_NVICwordoffset))
	str r2,[r3] //observed storing ?? at ???

	@;USART: resume update of USART2 configuration
	ldr r3,=USART2_BASE
	
	@;USART: enable USART2 RX interrupt
	ldr r2,[r3,#CR1]
	orr r2,#( (1<<5) ) @; RXNEIE=bit5
	str r2,[r3,#CR1]

	@;SYSTEM: set TX enable function for use by Msg_post()
	mov r0,#0
	MOV_imm32 r3,USART2_MsgCtl	
	str r0,[r3,#MSGHEAD_PTR]	@;clear the message list TODO : figure out how to clear off devices which might be on the list (system reset?)
	str r0,[r3,#MSGTAIL_PTR]	@; (maybe this argues for data in .bss so its cleared at startup.

	@;turn interrupts back on
	CPSIE i

	@;here with USART2 interrupt configured and RX interrupt enabled
	pop {r7,pc}

/*
    .global USART2_TXint_enab 	@;enables TX interrupt assuming USART2_IRQinit() previous called
    .thumb_func
USART2_TXint_enab: 
	push {r2,r3}				@;make safe for careless use
	MOV_imm32 r3,USART2_BASE
	ldr r2,[r3,#CR1]
	orr r2,#( (1<<7) ) @; TXEIE=bit7
	str r2,[r3,#CR1]
	pop {r2,r3}
	bx lr

    .global USART2_TXint_inhib 	@;inhibits TX interrupt assuming USART2_IRQinit() previous called
    .thumb_func
USART2_TXint_inhib: 
	push {r2,r3}				@;make safe for careless use
	MOV_imm32 r3,USART2_BASE
	ldr r2,[r3,#CR1]
	bic r2,#( (1<<7) ) @; TXEIE=bit7
	str r2,[r3,#CR1]
	pop {r2,r3}
	bx lr
*/
@;---
	.global USART2_MsgPost
	.thumb_func
USART2_MsgPost: @;void channelname_MsgPost((void *devicedata)) appends a command or task message to the channel's message list. 
@; low-level function designed to be called by MSG_post macro from within device command or task 
	push {r7,lr}

	@;arrive with r0 pointing to device data which has message info at #MSGPTR, #MSGCOUNT ffsets, put there by MSG_post macro
	MOV_imm32 r3,USART2_MsgCtl				@;msgchannel_handle in r3
	ldr r2,[r3,#MSGTAIL_PTR]				@;get pointer to device data of the message currently at the tail of the message queue
	cbz r2,1f								@;if message queue is empty then new message is both first and last			
	@;here when there's at least one message in the queue
	str	r0,[r2,#MSGLINK]					@;store pointer to our device data in the device_data of the current last in queue
	str	r0,[r3,#MSGTAIL_PTR]				@; and we become the last message in the queue
	b 2f
1: 	@;here if message queue is empty	
	str r0,[r3,#MSGHEAD_PTR]				@;store pointer to our device_data to make our message first in the queue
	str r0,[r3,#MSGTAIL_PTR]				@; and also last
	@;enable transmit interrupt	(transmit interrupt if turned 'off' whenever the list becomes empty so must be turnd back on here)
	MOV_imm32 r3,USART2_BASE
	ldr r2,[r3,#CR1]
	orr r2,#( (1<<7) ) @; TXEIE=bit7
	str r2,[r3,#CR1]
2:	str	r0,[r0,#MSGLINK]					@;link device to itself to flag that it has an active message and is last on list

 	pop {r7,pc}								@;  back to 'Msg_post' macro


	.global USART2_MsgsInit @;reset list to empty !!TODO clear any messages waiting on the message list 
	.thumb_func
USART2_MsgsInit: @;void MsgHandler_init();
	MOV_imm32 r0,USART2_MsgCtl
	mov r1,#0
	str r1,[r0,#MSGHEAD_PTR]
	str r1,[r0,#MSGTAIL_PTR]		
	bx lr					
	
/*	
	.global USART2_MsgHandler	@; int USART2_MsgHandler(void *devicedata, uint8_t pmsgdata, uint32_t msglength);
	.thumb_func
USART2_MsgHandler:	@; dispatched by device with the 'MSG_post' macro or called by a C function 
	push {r7,lr}
	
	MOVimm32 r3,USART2_MsgCtl				@;msgchannel_handle in r3
	ldr r2,[r3,#MSGHEAD_PTR]				@;get link to data structure of current message
	@;-- here with r2=0 if no messages, else r2 now points to device_data of the message
	cbz r2,1f								@; list is empty, so leave
	
2:	@;(future) might loop here in the case where multiple characters of the message might be sent at once
	.global Msg_sender	@;global for debugger visibility
	.thumb_func							
Msg_sender:  @; here to send next character of message; removes message from list when they have been sent
	@;here with r2=address of device_data struct holding message, r3=address of msgchannel_handle struct
	ldr r1,[r2,#MSGPTR]						@;r1 points to next message character
	ldrb r0,[r1],#1							@;  next message character in r0 
	@;attempt to send message character
	push {r2,r3}							@;save for use on return from nbTXfn()
	ldr r2,[r3,#TX_XEQ]					@;address of nbTXfn() in r2	!!TODO fix me and the conflict with interrupt driven transmit
 	blx r2									@;nbTXfn() returns +1 if char sent, -1 if fail to send
	pop {r2,r3}								@; restore pointers to current device_data and msgchannel_handle
	subs r0,#1								@;check if function's return in r0 =1 (character was sent)
	cbnz r0,1f								@;  send was blocked, so done for now -- leave (nothing is changed)
	@;here if the character was sent. r2=address of devicedata struct, r3=address of msgchannel_handle struct
	str r1,[r2,#MSGPTR]						@;update message pointer
	ldr r1,[r2,#MSGCOUNT]					@;update message count and test if =0
	subs r1,#1								@; (sets ZF if count reached 0)
	str r1,[r2,#MSGCOUNT]					@; .. 
@;	bne 2b	@; when burst-sending, attempts to send the nextcharacter of the message
	@; -- here with r2=address of device data structure containing the message control variables 
	bne 1f									@; message not done-- initially we'll only send one character at a time
	@;here if message count has reached 0 (message done)
	mov r1,#0								@;make MSGPTR=0 (MSGCOUNT alreeady is 0 from above)
	str r1,[r2,#MSGPTR]						@; ..
	@;here to remove msg link of this message from list
	ldr r0,[r2,#MSGLINK]					@;get address (if exist) of next message in list in r0
	str r1,[r2,#MSGLINK]					@;  then clear (write NULL) to this device's link
	mov r2,r0								@; maintain consistent meaning for r2 as address of device data structure
	cbz r2,3f								@;if link was null then list is empty so reset the list pointers to NUL 
	@;here when another message follows this one on the list -- make it new first on list
@;	MOV_imm32 r3,Msgs_list					@; unnecessary/duplicative -- done 'just in case'
	str r2,[r3,#MSGHEAD_PTR]				@;make this message's next message the new first message
	@; -- here with r2=address of next device data structure containing a message
	b 1f
@;	b 2b  @; when burst-sending, attempts to start the next message on the list

3:  @;here if no more messages on list ( r2=0 )		
	str r2,[r3,#MSGHEAD_PTR]					@;mark message list as empty
	str r2,[r3,#MSGTAIL_PTR]					@; ..
	
1:	@;here with r2=0 if nothing more to send, o.w. = address of device control array
	mov r0,r2								@;function returns address of continuing or new message, else returns 0 
	pop {r7,pc}								@;							
*/
@---------------------------------	

	.global USART2_RXbuffer_init @;uint32_t USART2_RXbuffer_init(void); //(re)initialize interrupt's 'bufbuf' data structure, return buf0/buf1 overrun count in r0 hi/lo
	.thumb_func
USART2_RXbuffer_init: 
	push {r7,lr} 
	MOV_imm32 r0,USART2_RXbufHANDLE
	MOV_imm32 r1,USART2_RXBUFSIZE
	bl ringbufbuf_init
	pop {r7,pc}

	.align 2 @; to quiet a linker warning about 4-byte boundary ??
	.global USART2_RXgetbuf0
	.thumb_func
USART2_RXgetbuf0:
	push {r7,lr}
	MOV_imm32 r0,USART2_RXbufHANDLE
	bl ringbufbuf0_rd
	pop {r7,pc}

	.global USART2_RXgetbuf1
	.thumb_func
USART2_RXgetbuf1:
	push {r7,lr}
	MOV_imm32 r0,USART2_RXbufHANDLE
	bl ringbufbuf1_rd
	pop {r7,pc}

@; --- USART2 RX miscellaneous management functions	
	.global 	USART2_RXgetRXBUF0_NUMOVERRUNS		@; hword : count of number of lost chars due to buffer overfill
	.global 	USART2_RXresetRXBUF0_NUMOVERRUNS		
	.global 	USART2_RXgetRXBUF0_NUMNEWLINES		@; ""	 : count of number of '\n' characters received
	.global 	USART2_RXresetRXBUF0_NUMNEWLINES		
	.global 	USART2_RXgetRXBUF1_NUMOVERRUNS		@; hword : count of number of lost chars due to buffer overfill
	.global 	USART2_RXresetRXBUF1_NUMOVERRUNS		
	.global 	USART2_RXgetRXBUF1_NUMNEWLINES		@; ""	 : count of number of '\n' characters received
	.global 	USART2_RXresetRXBUF1_NUMNEWLINES		

	.thumb_func
USART2_RXresetRXBUF0_NUMOVERRUNS:		@; hword : count of number of lost chars due to buffer overfill
	MOV_imm32 r1,USART2_RXbufHANDLE
	mov r0,#0
	strh r0,[r1,#(RXBUF0_NUMOVERRUNS)]
	bx lr

	.thumb_func
USART2_RXgetRXBUF0_NUMOVERRUNS:			@; hword : count of number of lost chars due to buffer overfill
	MOV_imm32 r0,USART2_RXbufHANDLE
	ldrh r0,[r1,#(RXBUF0_NUMOVERRUNS)]
	bx lr

	.thumb_func
USART2_RXresetRXBUF0_NUMNEWLINES:		@; ""	 : count of number of '\n' characters received
	MOV_imm32 r1,USART2_RXbufHANDLE
	mov r0,#0
	strh r0,[r1,#(RXBUF0_NUMNEWLINES)]
	bx lr

	.thumb_func
USART2_RXgetRXBUF0_NUMNEWLINES:			@; ""	 : count of number of '\n' characters received
	MOV_imm32 r1,USART2_RXbufHANDLE
	ldrh r0,[r1,#(RXBUF0_NUMNEWLINES)]
	bx lr

	.thumb_func
USART2_RXresetRXBUF1_NUMOVERRUNS:		@; hword : count of number of lost chars due to buffer overfill
	MOV_imm32 r1,USART2_RXbufHANDLE
	mov r0,#0
	strh r0,[r1,#(RXBUF1_NUMOVERRUNS)]
	bx lr

	.thumb_func
USART2_RXgetRXBUF1_NUMOVERRUNS:			@; hword : count of number of lost chars due to buffer overfill
	MOV_imm32 r0,USART2_RXbufHANDLE
	ldrh r0,[r1,#(RXBUF1_NUMOVERRUNS)]
	bx lr

	.thumb_func
USART2_RXresetRXBUF1_NUMNEWLINES:		@; ""	 : count of number of '\n' characters received
	MOV_imm32 r1,USART2_RXbufHANDLE
	mov r0,#0
	strh r0,[r1,#(RXBUF1_NUMNEWLINES)]
	bx lr

	.thumb_func
USART2_RXgetRXBUF1_NUMNEWLINES:			@; ""	 : count of number of '\n' characters received
	MOV_imm32 r1,USART2_RXbufHANDLE
	ldrh r0,[r1,#(RXBUF1_NUMNEWLINES)]
	bx lr

@; --- USART2 general error recording functions (both RX and TX errors are recorded in USART2_RXbufHANDLE record) 

	.global 	USART2_getRXBUF__NUMERRORS 		@; byte : count of the number of times USART2_IRQHandler_error_trap() is executed
	.global 	USART2_resetRXBUF__NUMERRORS 		
	.global 	USART2_getRXBUF__NUMUNKNOWNS   	@; ""   : count of the number of times USART2_IRQHandler_unknown_trap() is executed
	.global 	USART2_resetRXBUF__NUMUNKNOWNS   	
	.global 	USART2_getRXBUF__NUMPUTFAILS   	@; ""   : count of the number of times USART2_IRQHandler_putchar_failure_trap() is executed
	.global 	USART2_resetRXBUF__NUMPUTFAILS   	
	.global 	USART2_getRXBUF__NUMOTHERFAILS	@; ""	: future
	.global 	USART2_resetRXBUF__NUMOTHERFAILS

	.thumb_func
USART2_resetRXBUF_NUMERRORS: 		@; byte : count of the number of times USART2_RXIRQHandler_error_trap() is executed
	MOV_imm32 r1,USART2_RXbufHANDLE
	mov r0,#0
	strb r0,[r1,#(RXBUF_NUMERRORS)]
	bx lr

	.thumb_func
USART2_getRXBUF_NUMERRORS: 			@; byte : count of the number of times USART2_RXIRQHandler_error_trap() is executed
	MOV_imm32 r1,USART2_RXbufHANDLE
	ldrb r0,[r1,#(RXBUF_NUMERRORS)]
	bx lr
	
	.thumb_func
USART2_resetRXBUF_NUMUNKNOWNS:   	@; ""   : count of the number of times USART2_IRQHandler_unknown_trap() is executed
	MOV_imm32 r1,USART2_RXbufHANDLE
	mov r0,#0
	strb r0,[r1,#(RXBUF_NUMUNKNOWNS)]
	bx lr

	.thumb_func
USART2_getRXBUF_NUMUNKNOWNS:   		@; ""   : count of the number of times USART2_IRQHandler_unknown_trap() is executed
	MOV_imm32 r1,USART2_RXbufHANDLE
	ldrb r0,[r1,#(RXBUF_NUMUNKNOWNS)]
	bx lr

	.thumb_func
USART2_resetRXBUF_NUMPUTFAILS:   	@; ""   : count of the number of times USART2_IRQHandler_putchar_failure_trap() is executed
	MOV_imm32 r1,USART2_RXbufHANDLE
	mov r0,#0
	strb r0,[r1,#(RXBUF_NUMPUTFAILS)]
	bx lr

	.thumb_func
USART2_getRXBUF_NUMPUTFAILS:   		@; ""   : count of the number of times USART2_IRQHandler_putchar_failure_trap() is executed
	MOV_imm32 r1,USART2_RXbufHANDLE
	ldrb r0,[r1,#(RXBUF_NUMPUTFAILS)]
	bx lr

	.thumb_func
USART2_resetRXBUF_NUMOTHERFAILS:	@; ""	: future
	MOV_imm32 r1,USART2_RXbufHANDLE
	mov r0,#0
	strb r0,[r1,#(RXBUF_NUMOTHERFAILS)]
	bx lr

	.thumb_func
USART2_getRXBUF_NUMOTHERFAILS:		@; ""	: future
	MOV_imm32 r1,USART2_RXbufHANDLE
	ldrb r0,[r1,#(RXBUF_NUMOTHERFAILS)]
	bx lr
	
	
	
	@; separate RXBUF0, RXBUF1 operations to empty each buffer separately from the other
	 .global USART3_RXBUF0_discard
	.thumb_func
 USART2_RXBUF0_discard:	@;moves RXBUF0 read index up to match write index
	push {r7,lr}
	MOV_imm32 r0,USART2_RXbufHANDLE
	bl ringbufbuf0_reset 		@;uint32_t ringbufbuf0_reset(uint8_t *bufHANDLE); //'removes' values in buffer0 
	pop {r7,lr}
	
	 .global USART2_RXBUF1_discard
	.thumb_func
 USART2_RXBUF1_discard:	@;moves RXBUF1 read index up to match write index
 	push {r7,lr}
	MOV_imm32 r0,USART2_RXbufHANDLE
	bl ringbufbuf1_reset 		@;uint32_t ringbufbuf1_reset(uint8_t *bufHANDLE); //'removes' values in buffer1
	pop {r7,lr}

	
@;
