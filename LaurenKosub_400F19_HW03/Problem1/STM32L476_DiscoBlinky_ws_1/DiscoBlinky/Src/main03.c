// main03.c wmh 2019-08-21 : adding GreenLED Blinky function for STM32L476 Discover
// main02.c wmh 2019-08-21 : minor changes made (see !!wmh) to strip out all but bare necessities 

#include "stdint-gcc.h"	//for uint8_t, uint16_t, uint32_t  etc. 

//definitions in myDataOps02
uint32_t decodeAsciiHex(int a);

void SWdelay(uint32_t delaycount)
{
	int i;
	for(i=0;i<delaycount;i++);
}


// TEST: if main returns 0, then the methods were successful for inputs ranging from 0 to 127 -- aka contents of ascii table
//		 if main returns -1, then the methods were unsuccessful.
int main(void)
{
	int i;
	int dec, hex;
	for (i = 0; i < 128; i++) {
		dec = decodeAsciiDec(i);
		hex = decodeAsciiHex(i);
		if (i >= 48 && i <= 57) {
			if (dec != (i-48) || hex != (i-48)) {
				return -1;
			}
			// should be a digit and return same value
		} else if (i >= 65 && i <= 70) {
			if (hex != (i-55) || dec != -1) {
				return -1;
			}
		} else { //should return -1
			if (hex != -1) {
				return -1;
			}
		}
	}
	return 0;
}


