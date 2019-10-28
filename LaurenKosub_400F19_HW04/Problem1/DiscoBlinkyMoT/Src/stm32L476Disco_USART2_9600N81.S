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
	
	@;useful macro
	.macro MOV_imm32 reg, constant
		movw \reg, #:lower16:\constant
		movt \reg, #:upper16:\constant
	.endm


	
@;USART2 definitions

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

	
	

	.global USART2_init 	@;initialize USART2 for asynchronous 9600N81 communication
	.thumb_func
USART2_init: 
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
	MOV_imm32 r3,RCC_BASE			@; ..
	ldr r2,[r3,#RCC_APB1RSTR1]		@; ..
	orr	r2,#(1<<17)				@; set USART2_RST 
	str r2,[r3,#RCC_APB1RSTR1]		@; 
	nop							@; give it time to work (unnecessary?)
	nop							@; ..
	nop							@; ..
	nop							@; ..
	bic	r2,r2,#(1<<17)			@; clear USART2_RST to end reset
	str r2,[r3,#RCC_APB1RSTR1]		@; 

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
USART2_writeDR:			//debug: unconditional write to USART2 DR and return
 	push {r7,lr}
	ldr r3,=USART2_BASE	
	strb r0,[r3,#TDR]			@;	yes -- send data (automatically clears TXE)
	pop {r7,pc}					@; 		and return

