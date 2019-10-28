@; misc_utilities.S wmh 2019-10-18 : resource for 
	.syntax unified				@; ARM Unified Assembler Language (UAL). 
	.thumb						@; but here we'll use thumb instructions only

	@;------ utility macro
	.macro MOV_imm32 reg, constant
		movw \reg, #:lower16:\constant
		movt \reg, #:upper16:\constant
	.endm

	.global bytecopy @; uint8_t* bytecopy(uint8_t *dest, uint8_t *src, uint32_t count); //like C memcpy except returns pointer to end of dest 
	.thumb_func
bytecopy:
	@;leaf function so context is not saved 
	cbz r2,2f			@; 0-length strings are ok
1:	subs r2,#1			@; sets flags
	ldrb r3,[r1],#1
	strb r3,[r0],#1
	bne 1b
	@; here when copy is finished; r0 points to next available byte at dest
 	bx lr
	
	.global sprintf_uint32 @;	uint32_t* sprintf_uint32(uint8_t *str, uint32_t n);//convert word to ASCII numeric string in buffer, return pointer to end+1
	.thumb_func
sprintf_uint32:
	push {r4,r5}	@;we need more registers
	
	adr r2,dividers
1:	ldr r3,[r2],#4	@;get first divider
	cmp r3,r1		@;is divider greater than value
	bhi 1b			@;	yes -- skip leading 0s
2:	@;here with a value to convert in r1 and a divisor in r3
	udiv r5,r1,r3	@;r5 gets the binary value of leading digit of conversion
	add r4,r5,#'0'	@;convert it to ASCII	
3:	@;here with an ascii value in r4 to be stored in the output string	
	strb r4,[r0],#1	@; append it to the output string
	mul r5,r3,r5	@; recover the remainder and continue the conversion
	sub r1,r1,r5	@; ..
4:	@;here after writing a new character to the output string; r1 has remaining value to convert	
	ldr r3,[r2],#4	@;get the next divisor
	cbz	r3,5f		@;is the divisor the endmark (= 0)? Then we're done -- exit
	cmp r1,#0		@;	no -- then, is the remaining value to be converted non-zero?
	bne	2b			@;		yes-- generate and save the next digit of the conversion 
	@;here if next value to be converted is 0
	mov r4,#'0'		@; append ASCII '0'  it to the output string 
	strb r4,[r0],#1	@;  ..
	b 4b			@; and go up to continue the conversion
5:	@;here when number has been converted to an ASCII string; r0 points to end+1
	pop {r4,r5}
	bx lr
	
	.align 2		@;put word data on word boundares
dividers:	
	.word 1000000000
	.word 100000000
	.word 10000000
	.word 1000000
	.word 100000
	.word 10000
	.word 1000
	.word 100
	.word 10
	.word 1
	.word 0			@;endmarker

	
	
	
		