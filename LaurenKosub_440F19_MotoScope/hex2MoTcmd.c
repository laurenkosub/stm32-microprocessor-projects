//hex2MoTcmd.c wmh 2019-12-04 : generate MoT command string from console input
//	input is restricted to only only 2-,4- or 8-digit numbers using hex charactes 0-9,A-F,a-f
// 		good input: 	'01 02 03 4567 89ABCDEF'	output: ':0102036745EFCDAB895E'				(quotes added)
//		bad input:      '01 02 03 4567 9ABCDEF'		output:	'error: bad command arg 9ABCDEF'	(quotes added)
//getCmd01.c wmh 2019-12-04 : develop input validator 
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

typedef struct arg{
	uint32_t len;
	int val;
} arg_t;

//defined below
uint32_t write1hex(uint32_t, char *); 	//writes byte of val as two hex ASCII chars at phex, returns byte value
uint32_t write2LEhex(uint16_t val, char *phex); //writes two bytes of val little-endian as four hex ASCII chars at phex, return sum of bytes
uint32_t write4LEhex(uint32_t val, char *phex); //writes four bytes of val little-endian as eight hex ASCII chars at phex, return sum of bytes


int main(int argc, char *argv[])	 // generate MoT command string from console input (see info at top)
{
	uint8_t tst;
	uint32_t bytesum=0;
	uint8_t chksum=0;
	char badchar;
	char outbuf[100];	//!!TODO  make size a #define
	char *poutbuf=outbuf;
	int i;
	arg_t cmdarg[20];	//!!TODO make array size a #define

	
	if(argc <3) { printf("error: not enough values"); exit(1); }  			//must have at least device and command values
	if((cmdarg[1].len=strlen(argv[1])) != 2) { printf("error: bad device num"); exit(2); }	//device field must be two hex digits hex number 
	if((cmdarg[2].len=strlen(argv[2])) != 2) { printf("error: bad command num"); exit(3); }	//command field must be two hex digits
	for(i=3;i<argc;i++) {
		cmdarg[i].len = strlen(argv[i]);
		if( (cmdarg[i].len != 2) && (cmdarg[i].len != 4) && (cmdarg[i].len != 8) ) { printf("error: bad command arg %s",argv[i] ); exit(4); }	//command field must be two, four, aor eight hex digits  
	}
	//here with arguments checked for length
	
	*poutbuf++=':';
	
	for(i=1;i<argc;i++) {	//uses %X%c trick to identify bad values
		if(cmdarg[i].len == 2) {  
			if( (tst = sscanf(argv[i],"%02X%c",&cmdarg[i].val,&badchar)) != 1) { printf("error: bad hex: %s",argv[i] ); exit(5); }   
			bytesum += write1hex(cmdarg[i].val,poutbuf);	
			poutbuf +=2;
		}
		if(cmdarg[i].len == 4) { 
			if( (tst = sscanf(argv[i],"%04X%c",&cmdarg[i].val,&badchar)) != 1) { printf("error: bad hex: %s",argv[i] ); exit(6); }   
			bytesum += write2LEhex(cmdarg[i].val,poutbuf);	
			poutbuf +=4;
		}
		if(cmdarg[i].len == 8) { 
			if( (tst = sscanf(argv[i],"%08X%c",&cmdarg[i].val,&badchar)) != 1) { printf("error: bad hex: %s",argv[i] ); exit(7); }   
			bytesum += write4LEhex(cmdarg[i].val,poutbuf);	
			poutbuf +=8;
		}
	}

	//here with arguments validated and command string built except for checksum and newline
	chksum = 0xFF & (-(bytesum & 0xFF));
	write1hex(chksum,poutbuf); //chksum
	poutbuf +=2;
	*poutbuf++ ='\n';	//EOL
	*poutbuf++ ='\0';	// EOS

	
	printf("cmd string: %s",outbuf);	//command string for pasting 
		
	return 0;
}

// --- helper functions
uint32_t write4LEhex(uint32_t val, char *phex) //writes four bytes of val little-endian as eight hex ASCII chars at phex
// and returns sum of individual bytes of the value

{
	uint32_t tmp;
	uint32_t bytesum=0;
	tmp= val%256;	//least-significant byte (byte0) of val
	val= val/256;
	bytesum += tmp;
	sprintf(&phex[0],"%02X",tmp);
	tmp= val%256;	//byte1
	val= val/256;
	bytesum += tmp;
	sprintf(&phex[2],"%02X",tmp);
	tmp= val%256;	//byte2
	val= val/256;
	bytesum += tmp;
	sprintf(&phex[4],"%02X",tmp);
	tmp= val%256;	//most-significant byte (byte3) of val
	bytesum += tmp;
	sprintf(&phex[6],"%02X",tmp);
	return bytesum;
}

uint32_t write2LEhex(uint16_t val, char *phex) //writes two bytes of val little-endian as four hex ASCII chars at phex
// and returns sum of individual bytes of the value
{
	uint16_t tmp;
	uint32_t bytesum=0;
	tmp= val%256;	//least-significant byte (byte0) of val
	val= val/256;
	bytesum += tmp;
	sprintf(&phex[0],"%02X",tmp);
	tmp= val%256;	//most-significant byte (byte1) of val
	bytesum += tmp;
	sprintf(&phex[2],"%02X",tmp);
	return bytesum;
}

uint32_t write1hex(uint32_t val, char *phex) //writes byte of val as two hex ASCII chars at phex
// and returns byte value

{
	uint8_t tmp;
	uint32_t bytesum=0;
	tmp= val%256;	//we shouldn't need to do this but is might rescue us if user non-uint8_t argument for val
	bytesum += tmp;
	sprintf(&phex[0],"%02X",tmp);
	return bytesum;
}
