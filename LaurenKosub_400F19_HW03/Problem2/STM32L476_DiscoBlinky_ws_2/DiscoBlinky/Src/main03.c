// main03.c wmh 2019-08-21 : adding GreenLED Blinky function for STM32L476 Discover
// main02.c wmh 2019-08-21 : minor changes made (see !!wmh) to strip out all but bare necessities 

#include "stdint-gcc.h"	//for uint8_t, uint16_t, uint32_t  etc. 

//definitions in myDataOps02
int rpnCalc();

int main(void) {
	int r0, r1, r2, r3, r4, r5;
	r0 = rpnCalc("1 1 +");					// 2
	r1 = rpnCalc("1 1 + 1 +");				// 3
	r2 = rpnCalc("1 1 + 1 + 3 *");			// 9
	r3 = rpnCalc("1 1 + 1 + 3 * 2 /");		// 4
	r4 = rpnCalc("1 1 + 1 + 3 * 2 2 / ");	//9, 1
	r5 = rpnCalc("12 21 + 100 -");			//-67
	return 0;
}

