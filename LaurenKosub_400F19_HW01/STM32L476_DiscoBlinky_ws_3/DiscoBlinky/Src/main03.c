// main03.c wmh 2019-08-21 : adding GreenLED Blinky function for STM32L476 Discover
// main02.c wmh 2019-08-21 : minor changes made (see !!wmh) to strip out all but bare necessities 

#include "stdint-gcc.h"	//for uint8_t, uint16_t, uint32_t  etc. 

//definitions in GreenLED.S
void initGPIOE8();	//configures port bit PE8 (green LED) as GPIO output
void togglePE8();	//flips port bit PE8 (green LED) to its opposite state

//definitions in myDataOps02
uint32_t storeVARIABLE_00();
uint32_t storeVARIABLE_01();
uint32_t storeVARIABLE_02();
uint32_t storeVARIABLE_03();
uint32_t storeVARIABLE_04();
uint32_t storeVARIABLE_05();
uint32_t storeVARIABLE_06();
uint32_t storeVARIABLE_07();
uint32_t storeVARIABLE_08();
uint32_t storeVARIABLE_09();

void SWdelay(uint32_t delaycount)
{
	int i;
	for(i=0;i<delaycount;i++);
}

int main(void)
{
	uint32_t r0, r1, r2, r3, r4, r5, r6,r7,r8,r9;
	initGPIOE8();
	r0=storeVARIABLE_00();
	r1=storeVARIABLE_01();
	r2=storeVARIABLE_02();
	r3=storeVARIABLE_03();
	r4=storeVARIABLE_04();
	r5=storeVARIABLE_05();
	r6=storeVARIABLE_06();
	r7=storeVARIABLE_07();
	r8=storeVARIABLE_08();
	r9=storeVARIABLE_09();
	while (1)
	{
		SWdelay(100000);
		togglePE8();
	}

}


