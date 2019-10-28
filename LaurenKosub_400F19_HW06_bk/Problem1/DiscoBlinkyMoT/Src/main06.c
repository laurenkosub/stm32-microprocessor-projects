// main06.c wmh 2019-09-18 : revised mesage handler
// main05.c wmh 2019-09-14 : begin MoT adaptation by bringing code from MoT_demo_main02_with_USART3.c
// we are initially only implementing the admin console
// we are initially just going to substitute current 'L476 USART2 for prior USART1 as admin console. 
// we are not initially going to implement 'L476 interrupts but instead just poll USART1
// we are not initially implementing messaging
// --> it turns out that with the above simplifications, much of MoT_demo_main02_with_USART3.c wmh 2019-06-13
// which we thought to bring over is unnecessary, other than than the call to init_Cmd_handle() and the call to 
// Cmd_Handler() in main's while(1) -- see /src/MoT for the three files we had to add. 
// main04.c wmh 2019-09-13 : working USART2 initialization and demo.
// main03.c wmh 2019-08-21 : adding GreenLED Blinky function for STM32L476 Discover
// main02.c wmh 2019-08-21 : minor changes made (see !!wmh) to strip out all but bare necessities 

#include "stdint-gcc.h"	//for uint8_t, uint16_t, uint32_t  etc. 

//definitions in stm32L476Disco_USART2_9600N81.S

/* !!TODO rewrite the below functions from MoT_demo_main02_with_USART3.c for 'L476 USART2
//functions defined in stm32f429xx_USART1_bufbuf_interrupt02.S and stm32f429xx_USART3_bufbuf_interrupt02.S
void USART1_buffer_init(void);
void USART1_IRQinit(void);	
int32_t USART1_getbuf0(void); //get a character from USART1's RX buf0. Non-blocking, returns char >= 0 or -1 if fail/no char
*/ 
/*
	typedef struct {
		int (*nbTX)(uint8_t);
		void *pMsghead;
		void *pMsgtail;
	} TXchannel_t;

	TXchannel_t Admin_TX = { USART2_nbputchar, (void *)0, (void *)0 };
*/
//definitions in stm32L476Disco_GreenLED.S
void GreenLED_init();	//configures port bit PE8 (green LED) as GPIO output
//void GreenLED_ON();		//sets bit PE8 (green LED)
void GreenLED_OFF();	//resets bit PE8 (green LED)


// TIM2 File
//uint32_t TIM2_demo();
uint32_t TIM2_init(uint32_t DELAY);
uint32_t TIM2_poll();

void SWdelay(uint32_t delaycount)
{
	int i;
	for(i=0;i<delaycount;i++);
}

int32_t serchar;	//global so easier to watch in the debugger

int main(void) {
	GreenLED_init();
	GreenLED_OFF();

	TIM2_init(333);
	//TIM2_demo();
	TIM2_poll();
}


