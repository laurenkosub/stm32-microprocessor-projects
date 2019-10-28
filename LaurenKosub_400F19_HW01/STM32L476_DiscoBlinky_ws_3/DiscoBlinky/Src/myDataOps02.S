@;myDataOps01.S wmh 2019-09-03 : ARM data instruction examples

@; --- characterize target syntax, processor
	.syntax unified				@; ARM Unified Assembler Language (UAL). 
								@; Code written using UAL can be assembled 
								@; for ARM, Thumb-2, or pre-Thumb-2 Thumb
	.thumb						@; but here we'll use thumb instructions only

@; --- constant definitions (locally symbol macros -- these do not use storage)
	.equ silly,0x12345678
	
@; --- _initialized_ RAM data					
	.data						@; keyword '.data' starts the _initialized_ RAM data section
	.align 2					@; .align's argument is power of 2, so this pads memory to start on 4-byte (e.g. word) boundary
	.global Dword				@; this makes variable 'Dint' visible everywhere in the program (C and asm sources) 
Dword: 	.word  0xAAAA5555   	@; Dword is 32-bits
Dhalf:	.hword 0xABCD       	@; Dhalf is 16-bits and local to this source file
Dbyte: 	.byte  0x55   		    @; Dbyte is 8-bits and local to this source file  
Myword: .word 0xDEADBEEF
Myhalf: .hword 0x2222
Mybyte: .byte 0x0
  

 @; --- _uninitialized_ RAM data	
	.bss						@; keyword 'bss' starts the _uninitialized_ RAM data section				 
	.align	2					@; pad to word-boundary
global_bss_begin:				@; marker for start of  global .bss variables
	.comm	Garray,256			@; 256 bytes of static storage starting at global label 'Garray'
	.comm	Gword,4				@; 4 bytes of static storage starting at global label 'Gword'
	.comm	Ghalf,2				@; 2 bytes of static storage starting at global label 'Ghalf'
	.comm	Gbyte,1				@; 1 byte of static storage starting at global label 'Gbyte'
	
	.align	2					@; pad to word-boundary
local_bss_begin:				@; marker for start of  local .bss variables
	.lcomm	Larray,256			@; 256 bytes of static storage starting at local label 'Larray'
	.lcomm	Lword,4				@; 4 bytes of static storage starting at local label 'L
	.lcomm	Lhalf,2				@; 2 bytes of static storage starting at local label 'L
	.lcomm	Lbyte,1				@; 1 byte of static storage starting at local label 'L
	
	
@; --- program memory and constant data
	.text						@;keyword '.text' starts the code section (in ROM)
	
@; Homework Problem #1 -- as many ways of  loading constants to register as you can devise

	.global loadCONSTANT_00		@; method 00 demo/gift 
	.thumb_func 				@; make this function thumb-compatible
loadCONSTANT_00:	@; is a 'leaf function' with no local variables, so no stack frame required
	movw r0,#:lower16:Dword		@; get _address_ of Dword in r0
	movt r0,#:upper16:Dword		@; ..
	bx lr						@; return to caller with constant value in r0

	
@; Homework Problem #2 -- as many ways of  loading variables to register as you can devise

	.global loadVARIABLE_00 	@; method 00 demo/gift 
	.thumb_func					
loadVARIABLE_00:
	push {lr}		@; we are not a leaf function so we have to save the link register
	bl loadCONSTANT_00	@; returns address of variable 'Dword' in r0
	ldr r0,[r0,#0]		@; read contents of memory at address 'Dword'
	pop {pc}		@; return to caller with contents of 'Dword' in r0

@; Homework Problem #3 -- as many ways of storing variables from register as you can devise	
	
	.global storeVARIABLE_00 	@; method 00 demo/gift 
	.thumb_func					
storeVARIABLE_00:		
	push {lr}					@; we are not a leaf function so we have to save the link register		
	bl loadCONSTANT_00			@; returns address of variable 'Dword' in r0
	bl loadVARIABLE_00			@; returns contents of variable 'Dword' in r0
	add r1,r0,#1				@; add 1 to contents of 'Dword'
	bl loadCONSTANT_00			@; returns address of variable 'Dword' in r0	
	str r1,[r0,#0]				@; write incremented value at address 'Dword'
	pop {pc}					@; return to caller - we're a void function so r0 is don't-care

	.global loadDword 			@; 
	.thumb_func					
loadDword: @;demo for Discussion
	@; With a few hours of messing around I have only been able to come up with one thing I know works: 
	ldr r0, =Dword
	bx lr

@; --- HW02 Problem 3
	.global storeVARIABLE_01 	@; method 01
	.thumb_func
storeVARIABLE_01:
	push {lr}					@; we are not a leaf function so we have to save the link register
	bl loadCONSTANT_00	@; returns address of variable 'Dword' in r0
	bl loadVARIABLE_00	@; returns contents of variable 'Dword' in r0
	add r1,r0,#1		@; add 1 to contents of 'Dword'
	bl loadCONSTANT_00	@; returns address of variable 'Dword' in r0
	str r1,[r0,#4]!		@; address mode: pre-indexed. Store the value found in R2 (0x03) to the memory address found in R1 plus 4. Base register (R1) modified: R1 = R1+4
	str r1,[r0,#4]!		@;  address mode: pre-indexed. Store the value found in R2 (0x03) to the memory address found in R1 plus 4. Base register (R1) modified: R1 = R1+4
	pop {pc}					@; return to caller - we're a void function so r0 is don't-care

	.global storeVARIABLE_02 	@; method 02
	.thumb_func
storeVARIABLE_02:
	push {lr}		@; we are not a leaf function so we have to save the link register
	ldr r2, [r0]		@;  load the value (0x03) at memory address found in R0 to R2
	orr r2, Dbyte 		@; preform or operation on r2 and Dbyte and store the result in r2
	eor r2, Dbyte 		@; preform xor operation on r2 and Dbyte and store the result in r2
	str r2, [r1,r2]		@; address mode: offset. Store the value found in R2 (0x03) to the memory address found in R1 with the offset R2 (0x03). Base register unmodified.
	pop {pc}		@; return to caller - we're a void function so r0 is don't-care


	.global storeVARIABLE_03 	@; method 03
	.thumb_func
storeVARIABLE_03:
	push {lr}		@; we are not a leaf function so we have to save the link register
	ldr r2, [r0]		@;  load the value (0x03) at memory address found in R0 to R2
	str r2, [r1, r2, LSL#2] @; address mode: offset. Store the value found in R2 (0x03) to the memory address found in R1 with the offset R2 left-shifted by 2. Base register (R1) unmodified.
    	and r2, #0xFF		@; preform an AND or r2 and 0xFF and store the value in r2
    	pop {pc}		@; return to caller - we're a void function so r0 is don't-care

// store multiple
	.global storeVARIABLE_04 	@; method 04
	.thumb_func
storeVARIABLE_04:
	push {lr}			@; we are not a leaf function so we have to save the link register
	mov r3, #0x11			@;  load the value (0x03) at memory address found in R0 to R3
	mov r4, Dbyte			@;  load the value (0x03) at memory address found in R0 to R4
	mov r5, Mybyte			@;  load the value (0x03) at memory address found in R0 to R5
	ldr r6, [r0]			@;  load the value (0x03) at memory address found in R0 to R6
	stm	r0!,{r3-r6}		@; store multiple registers
	stmdb r1!,{r4,r6}		@; store multiple registers, decrement address before each transfer
    pop {pc}				@; return to caller - we're a void function so r0 is don't-care

	.global storeVARIABLE_05
	.thumb_func
storeVARIABLE_05:
	push {lr}
	stc p10,c2,[r0]		@; stc transfers data between memory and the coprocessor
	pop {pc}

	.global storeVARIABLE_06
	.thumb_func
storeVARIABLE_06:
	push {lr}
	str r6,[r0,r4,lsl #3]	@; pre indexed
	pop {pc}

// preform operations on and update a register
	.global storeVARIABLE_07
	.thumb_func
storeVARIABLE_07:
	push {lr}
	mov r7, #0	@; r7 = 0
	and r7, #1	@; r7 = 0 AND 1
	add r7, #2	@; r7 = (0 AND 1) + 2
	neg r7, r7	@; r7 = NOT( (0 AND 1) + 2)
	mul r7, r7	@; r7 = r7 * r7
	sub r7, r7	@; r7 = r7 - r7

	str r7, [r7, #0] @; end result should be zero
	pop {pc}

// store a byte in r8 using strb
	.global storeVARIABLE_08
	.thumb_func
storeVARIABLE_08:
	push {lr}
	mov r1, Dbyte
	strb r8, [r1,#0x44]
	pop {pc}

// store a half word in r9 using strh
	.global storeVARIABLE_09
	.thumb_func
storeVARIABLE_09:
	push {lr}
	mov r1, Dhalf
	strh r9, [r1,#0x4444]
	pop {pc}



	
@; --- some constant data we're putting in ROM which you might access with some of your instructions

	.global	ROMdata				@; global label of test target data area
	.align 2					@; pad memory if necessary to align on word boundary for word storage 
ROMdata:						@; start of test data area	
	.byte 0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F	@;16 bytes with contents = offset from start
	.byte 0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E,0x1F	@;""
	.byte 0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2A,0x2B,0x2C,0x2D,0x2E,0x2F	@;""
	.byte 0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x3A,0x3B,0x3C,0x3D,0x3E,0x3F	@;""
	.byte 0x40,0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4A,0x4B,0x4C,0x4D,0x4E,0x4F	@;""
	.byte 0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57,0x58,0x59,0x5A,0x5B,0x5C,0x5D,0x5E,0x5F	@;""
	.byte 0x60,0x61,0x62,0x63,0x64,0x65,0x66,0x67,0x68,0x69,0x6A,0x6B,0x6C,0x6D,0x6E,0x6F	@;""
	.byte 0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77,0x78,0x79,0x7A,0x7B,0x7C,0x7D,0x7E,0x7F	@;""
	.byte 0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F	@;""
	.byte 0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F	@;""
	.byte 0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF	@;""
	.byte 0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF	@;""
	.byte 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF	@;""
	.byte 0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF	@;""
	.byte 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF	@;""
	.byte 0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF	@;"" , 256 bytes total
	 
