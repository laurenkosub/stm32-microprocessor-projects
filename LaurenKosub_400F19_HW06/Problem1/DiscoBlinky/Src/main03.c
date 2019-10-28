// main03.c wmh 2019-08-21 : adding GreenLED Blinky function for STM32L476 Discover
// main02.c wmh 2019-08-21 : minor changes made (see !!wmh) to strip out all but bare necessities 

#include "stdint-gcc.h"	//for uint8_t, uint16_t, uint32_t  etc. 

//definitions in GreenLED.S
void initGPIOE8();	//configures port bit PE8 (green LED) as GPIO output
void togglePE8();	//flips port bit PE8 (green LED) to its opposite state

//definitions in myDataOps02
uint32_t TIM2_init(uint32_t delay);
void TIM2_poll();

void SWdelay(uint32_t delaycount)
{
	int i;
	for(i=0;i<delaycount;i++);
}

int main(void)
{
	initGPIOE8();
	TIM2_init(333);
	TIM2_poll();

}


