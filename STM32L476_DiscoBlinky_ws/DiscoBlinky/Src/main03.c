// main03.c wmh 2019-08-21 : adding GreenLED Blinky function for STM32L476 Discover
// main02.c wmh 2019-08-21 : minor changes made (see !!wmh) to strip out all but bare necessities 

#include "stdint-gcc.h"	//for uint8_t, uint16_t, uint32_t  etc. 

//definitions in GreenLED.S
void initGPIOE8();	//configures port bit PE8 (green LED) as GPIO output
void togglePE8();	//flips port bit PE8 (green LED) to its opposite state

//definitions in myDataOps02
uint32_t loadCONSTANT_00();
uint32_t loadCONSTANT_01();
uint32_t loadCONSTANT_02();
uint32_t loadCONSTANT_03();
uint32_t loadCONSTANT_04();
uint32_t loadCONSTANT_05();
uint32_t loadCONSTANT_06();
uint32_t loadCONSTANT_07();
uint32_t loadCONSTANT_08();

void SWdelay(uint32_t delaycount)
{
	int i;
	for(i=0;i<delaycount;i++);
}

int main(void)
{
	uint32_t r0, r1, r2, r3, r4, r5, r6, r7, r8;
	initGPIOE8();
	r0 = loadCONSTANT_00();
	r1 = loadCONSTANT_01();
	r2 = loadCONSTANT_02();
	r3 = loadCONSTANT_03();
	r4 = loadCONSTANT_04();
	r5 = loadCONSTANT_05();
	r6 = loadCONSTANT_06();
	r7 = loadCONSTANT_07();
	r8 = loadCONSTANT_08();
	while (1)
	{
		SWdelay(100000);
		togglePE8();
	}

}


