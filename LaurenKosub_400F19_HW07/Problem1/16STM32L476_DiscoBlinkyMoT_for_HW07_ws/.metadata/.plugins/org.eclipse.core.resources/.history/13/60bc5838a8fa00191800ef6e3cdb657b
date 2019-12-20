// PROBLEM 1

// main09.c wmh 2019-10-21 : adds HCLK48MHz_init() in stm32L476xx_HCLK48MHz_01.S for clock speedup to 48MHz 
//	- clock speedup 'kind of works' but system seems unstable so is left out for now
// main09.c wmh 2019-10-16 : adding TIM2 operations and interrupt
// main08.c wmh 2019-10-14 : moving all message handling to USART2 (new concept) -- see _readme_how_MoT_messaging_works02.txt
// main07.c wmh 2019-10-12 : continued development
// main06.c wmh 2019-09-18 : revised message handler
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
void USART2_init(void); 			//initialize USART2 for asynchronous 9600N81 communication
int USART2_nbgetchar(void);			//success: return data>=0; failure: return -1
int USART2_nbputchar(uint8_t c);	//success: return +1; failure: return -1
int USART2_bgetchar(void);			//blocks until new data, then return data
void USART2_bputchar(char c);		//block until character can be sent
void USART2_writeDR(char c);		//debug: unconditional write to USART2 DR and return

//definitions in stm32L476Disco_GreenLED.S
void GreenLED_init();		//configures port bit PE8 (green LED) as GPIO output
void GreenLED_ON();			//sets bit PE8 (green LED) 
void GreenLED_OFF();		//resets bit PE8 (green LED)
void GreenLED_toggle();		//flips bit PE8 (green LED) to opposite state

//defined here so we can watch it
uint32_t TIM2_ticks;		//updated in TIM2 interrupt, defined here so viewable as Eclipse 'expression'

//MoT functions
void init_adminCmd_handle(); 		//initialize command buffer indexes, sets entry point at Cmd_wait_for_startchar()
void Cmd_Handler(void *);			//parses serial input and dispatches tasks
void Msg_Handler_init(void *, int (*)(uint8_t));
void *Msg_Handler(void *);			//returns 0 if no more messages, else address of current message's device data
void Msg_Handler_phony_post(void);	//'posts' a message on Msg_list to test Msg_Handler
void init_Cmd_handle(uint32_t *,uint32_t *, uint32_t *,uint32_t * );	//!!3rd argument is a int-void assembly function address but this works if we have declared it '.thumb_func'

//MoT admin variables 
extern uint32_t adminCmd_handle;	//reference point in Cmd_handle data structure (see \MoT\MoT_admin_cfg01.S)
extern uint32_t adminDevicetable;	//address of adminDevicetable       --"--
extern uint32_t adminTasklist;		//address of adminTasklist          --"--
extern uint32_t adminMsgctl;		//address of adminMsg_ctl
extern uint32_t USART2_RXgetbuf0;	//shady trick for passing function address

void SWdelay(uint32_t delaycount) 
{
	int i;
	for(i=0;i<delaycount;i++);
}

int32_t serchar;	//global so easier to watch in the debugger

//defined in stm32fL476xx_TIM2_demo05.S
void TIM2_NVIC_init();
void DBGMCU_FREEZE_TIM2();
void DBGMCU_UNFREEZE_TIM2();
void TIM2_CH1_out_to_PA0();
void TIM2_init();
void TIM2_IRQHandler();
void TIM2_delay();

//defined in stm32L476Disco_GreenLED.S
void GreenLED_init();
void GreenLED_ON();
void GreenLED_OFF();
void GreenLED_toggle();
void RedLED_init();
void RedLED_ON();
void RedLED_OFF();
void RedLED_toggle();

void LSE_init();
void HCLK48MHz_init();
void TIM2PWM_init();

int main(void)
{
	LSE_init();
//	HCLK48MHz_init();		//Breaks things. Signs point to unstable MCU after change
	TIM2_NVIC_init();		//called here during testing, then moved to LL or MoT device
//	GreenLED_init();		// ""
	RedLED_init();			// ""
//	TIM2PWM_init();			// ""
	TIM2_init();
//	DBGMCU_FREEZE_TIM2();	//test and debug utility
	
	USART2_init(); 			// USART2 is admin Cmd and Msg channel
	init_Cmd_handle(&adminCmd_handle, &adminDevicetable, &USART2_RXgetbuf0, &adminTasklist);

	while (1)
	{
		Cmd_Handler(&adminCmd_handle);
	}
}


