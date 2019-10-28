// main03.c wmh 2019-08-21 : adding GreenLED Blinky function for STM32L476 Discover
// main02.c wmh 2019-08-21 : minor changes made (see !!wmh) to strip out all but bare necessities 

#include "stdint-gcc.h"	//for uint8_t, uint16_t, uint32_t  etc. 

//definitions in GreenLED.S
void initGPIOE8();	//configures port bit PE8 (green LED) as GPIO output
void togglePE8();	//flips port bit PE8 (green LED) to its opposite state

//definitions in myDataOps02
uint32_t loadVARIABLE_00();
uint32_t loadVARIABLE_01();
uint32_t loadVARIABLE_02();
uint32_t loadVARIABLE_03();
uint32_t loadVARIABLE_04();
uint32_t loadVARIABLE_05();
uint32_t loadVARIABLE_06();
uint32_t loadVARIABLE_07();

void SWdelay(uint32_t delaycount)
{
	int i;
	for(i=0;i<delaycount;i++);
}

int main(void)
{
	uint32_t r0, r1, r2, r3, r4, r5, r6, r7;
	initGPIOE8();
	r0=loadVARIABLE_00();
	r1=loadVARIABLE_01();
	r2=loadVARIABLE_02();
	r3=loadVARIABLE_03();
	r4=loadVARIABLE_04();
	r5=loadVARIABLE_05();
	r6=loadVARIABLE_06();
	r7=loadVARIABLE_07();
	while (1)
	{
		SWdelay(100000);
		togglePE8();
	}

}


