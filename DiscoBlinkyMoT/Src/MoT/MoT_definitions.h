//MoT_definitions.h wmh 2019-06-12 : collection of structure offsets, buffer sizes, etc using in the MoT design

#ifndef __MOT_DEFS__
	#define __MOT_DEFS__	
	
	#define EOF -1
	#define NULL 0

//control and message channels --  structures used by USART interrupt
//	.align 2	//put data on word-boundary
//USARTn_RXbufStruct: struct for control of USARTn received data
//	.skip 32				//buffer control and statu
//	.global USART1_RXbufHANDLE //make visible in debugger and main()
//USARTn_RXbufHANDLE:			//buffer 'handle' which is passed to buffer management functions; positive/negative offsets from handle give access to data/buffer control 
//	.skip USART1_RXBUFSIZE	//buffer data

	// constants defined  below are offsets from handle 'USART1_RXbufHANDLE' 'handle' of USART1_RXbufStruct allocated above.
	// USART1_RXbufHANDLE is an argument of most calls to buffer operations defined here and elsewhere
	#define  RXBUF_STATUS -32		// general buffer control and status records	
	#define  RXBUF_NUMERRORS -32	// 		byte : count of the number of times USART1_IRQHandler_error_trap() is executed
	#define  RXBUF_NUMUNKNOWNS -31	// 		""   : count of the number of times USART1_IRQHandler_unknown_trap() is executed
	#define  RXBUF_NUMPUTFAILS -30	// 		""   : count of the number of times USART1_IRQHandler_putchar_failure_trap() is executed
	#define  RXBUF_NUMOTHERFAILS -29 // 		""	: future
	#define  RXBUF0_NUMOVERRUNS -28	// hword -- BUF0-,BUF1-specific parameters' offsets (one set for each read-buffer)
	#define  RXBUF1_NUMOVERRUNS -26	// ""
	#define  RXBUF0_NUMNEWLINES -24	// ""	
	#define  RXBUF1_NUMNEWLINES -22	// ""	
	#define  RXBUF0_RDINDEX -20		// word
	#define  RXBUF1_RDINDEX -16		// ""
	#define  RXBUF_COUNT -12		// ""  number of unread characters remaining in primary buffer BUF0
	#define  RXBUF_MAXINDEX -8		// ""  stored here in buffer struct rather than loaded as a constant to give faster access
	#define  RXBUF_WRINDEX -4		// ""


// offsets of elements of message control structure
	#define NBTX_FUNC 0
	#define MSGHEAD_PTR 4
	#define MSGTAIL_PTR 8
	
//MoT device control: standard variable offsets in the .data of each MoT 'device'
	// offsets of standard variables in device's control structure
	#define XEQ 0				// offset in the devices task control structure to the devices coroutine resume-execution address
	#define NEXT 4				// offset in the devices task control structure to the next device in the Tasklist
	#define PREV 8				// offset in the devices task control structure to the next device in the Tasklist
	#define MSGPTR 12			//will hold pointer to this messages next character to print
	#define MSGCOUNT 16			//will hold count of remaining number of characters of message to print
	#define MSGLINK 20			//will hold pointer to data structure of next device with a message (if any)

// Cmd_handle data structure definitions and relative offsets -- !! put all of this in section .data and initialize it a compile-time ==> no need for 'init'
	#define CMD_DEVICETABLE -4	//holds address of device dispatch table
	#define CMD_SOURCE -8		//entry point of function reading serial input stream and returning command, byte by byte
	#define MSG_DEST -12			//??
	#define CMD_STATE -16		//holds address of resume-address of command parser
	#define CMD_WRINDX -20		//offset in command buffer to location where next byte will be written
	#define TASKLIST -24			//holds address of tasklist root

// Tasklist head and tail control structs use XEQ, NEXT and PREV offsets defned above for MoT device control.
// Tasklist head has an added variable C_startingSP which is used to clean up the stack after C tasks 
	#define C_startingSP 12		// offset in admin/userTasklist where starting SP is stored


	#ifdef __ASSEMBLY__
/*
	rTASKP 	.req r4		@;is there a C equivalent? alias for r4 - current place in task list; system variable must be preserved through function calls, interrupts
		rCMDP	.req r5		@;alias for r5 - holds Cmd_Handler resume-address (e.g. command parse-state) 
	//	rMSGP	.req r6
*/
	@------------------ constant and macro definitions

	@;------ system variable kept in register
		rTASKP 	.req r4			@;holds current place in task list; always valid on task entry
		rCMDP	.req r5			@;holds address of current Cmd_handle

	@;------ utility macro
		.macro MOV_imm32 reg, constant
			movw \reg, #:lower16:\constant
			movt \reg, #:upper16:\constant
		.endm
		
	@;------ macro used in MoT commands
		.macro LINK_me	mydata, myXEQ 	@; installs a device in the Tasklist
		@; this macro is placed at the exit of commands called from Cmd_Handler which install a device task on the task list
		@; 'mydata' is the address the tasks data structure; task data structures are preallocated and optionally initialized at system startup
		@; 'myXEQ' is the devices execution-resume address.
		@; note: this macro is placed only at Cmd_Handler()s exit point so we are free to use r0-r3 without consequences
		@; 
		MOV_imm32 r3,\mydata		@;pointer to this (new) devices task control structure in r3
		ldr r2,[r3,#XEQ]			@;check -- is this device already installed (
		cbnz r2,1f					@;  yes -- stop installation right now !!fix this if you can think of something better			
	//	MOV_imm32 r2,Tasklist_root	@;pointer to the Tasklist origin in r2
		ldr r2,[rCMDP,#(TASKLIST)]	@;get task list origin
		ldr r1,[r2,#NEXT]			@;pointer to current first list element in r1
		ldr r1,[r2,#NEXT]			@;pointer to current first list element in r1
		MOV_imm32 r0,\myXEQ			@;pointer to the new devices entry point in r0
		str r0,[r3,#XEQ]			@; ..
		str r3,[r2,#NEXT]			@;link this device as new first on list
		str r3,[r1,#PREV]			@;link new first as previous of the old first
		str r1,[r3,#NEXT]			@;link old first as next of this device
		str r2,[r3,#PREV]			@;link list root as previous of this device
	1:	@;installation skipped by jumping here from cbnz abovd
		.endm

	@;------ macros used in MoT tasks
		.macro UNLINK_me mydata  	@; remove a device from the Tasklist
		@; this macro is placed at the exit of tasks which are removing themselves from the Tasklist
		@; removing a task from the Tasklist does not destroy the tasks data so it could be part of a scheme to suspend rather than kill tasks
		@; because this is placed at the exit point back to main (via pop {r7,pc} ) we are free to use r0-r3
		@; 
		MOV_imm32 r3,\mydata		@;get address of (this devices) list element to be unlinked
		ldr r2,[r3,#PREV]			@;get elements predecessor in r2
		ldr r1,[r3,#NEXT]			@;get elements successor in r1
		str r1,[r2,#NEXT]			@;link old predecessor to old successor
		str r2,[r1,#PREV]			@;link old successor to old predecessor
		mov r0,#0					@; clear obsolete links
		str r0,[r3,#XEQ]			@; ..
		str r0,[r3,#NEXT]			@; ..
		str r0,[r3,#PREV]			@; ..
		.endm
			
		.macro RELINK_me newXEQ	@; redirect to another section of this devices routines
		@; this macro automates replacing the device tasks resume address; 
		@; rTASKP points to the tasks data element because we are in the task 
		MOV_imm32 r2,\newXEQ		@;get coroutines entry address
		str r2,[rTASKP,#XEQ]		@; set up for next dispatch
		.endm
		
	@;------ wrapper for MSG_post_fn()  (see MoT_Msg_Handler.S)
		@; - initializes message coontrol values and MSG_post_fn() arguments and branches to MSG_post_fn() 
		@; - uses/destroys contents of r0-r3
		@; - returns 0 if success and -1 if fail (device already has a message posted)
		@; - prevents message linked list from being broken
		@; 
		.macro MSG_post msgchannel, mydata, msgtext, msglength	@;called by commands and tasks to put a message in the message queue
			MOV_imm32 r0,\msgchannel@; address of msgchannel handle
			MOV_imm32 r1,\mydata	@; address of this tasks device control block 
			ldr r2,[r1,#MSGLINK]	@; is a message from this task on the message list already ?
			cbnz r2,1f				@;		yes -  abort posting and report failure		
			MOV_imm32 r2,\msgtext	@;		else continue building message info
			str r2,[r1,#MSGPTR]		@;  	..
			MOV_imm32 r2,\msglength	@;  	..
			str r2,[r1,#MSGCOUNT]	@;  	..
			@;post the message
			push {r7,lr}			
			bl MSG_post_fn			
			pop	{r7,lr}
			@;here with message posted
			mov r0,#0				@;flag success (message was posted)
			b 2f					
		1:	mov r0,#(-1)			@;flag failure (message not posted)
		2:	@;continue in device code
		.endm

	#else //not assembly, so C
		//definitions below are brought in from 'deviceRedLED05.c' initial MoT C developments
		#include "stdint-gcc.h"	//for uint8_t, uint16_t, uint32_t  etc. 
		#include "stddef.h"		//for NULL

		//macro to process strings for use with post_Cdevicemsg()
		#define CHARCOUNT(string) (sizeof(string) -1)  //not including the strings '\0'

		//master task control structure for device (pointed to by rTASKP) 
		typedef struct taskCTL {	//task control structure common to all tasks
			void (*xeq)(void);		//,0		@; offset in the devices task control structure to the devices coroutine resume-execution address
			struct taskCTL * next;	//,4		@; offset in the devices task control structure to the next device in the tasklist
			struct taskCTL * prev;	//,8		@; offset in the devices task control structure to the next device in the tasklist
			char * msgptr;			//,12		@;will hold pointer to this messages next character to print
			uint32_t msgcount;		//,16		@;will hold count of remaining number of characters of message to print
			struct taskCTL * msglink;	//,20	@;will hold pointer to data structure of next device with a message (if any)
			void * dataptr;			//,24	@;untyped; used as pointer to a custom struct for this task
		} taskCTL_t;

		//TODO : check that in all cases this struct is placed at the origin of the device data, so that r4=rTASKP is valid
		static taskCTL_t myCTL;		//'static' makes private to current task, may initialize all to 0 (CHECK THIS!)									
									//question: how is myCTL related to rTASKP (r4) of assembly tasks? 
									//	--> ans: r4/rTASKP is valid in tasks, myCTL is valid in both tasks and commands but slower the rTASKP for use in tasks 
		
		// system variable
		extern taskCTL_t Tasklist_root;			//system variable holds pointer to first on task list
	
		//MoT functions
		void suspend_Ctask(taskCTL_t * pCTL);	//task exit procedure
		void link_Ctask(taskCTL_t * pCTL, void (*CtaskXEQ)(void));
		void unlink_Ctask(taskCTL_t * pCTL);
		void relink_Ctask(taskCTL_t * pCTL, void (*CtaskXEQ)(void));
		uint32_t post_Cdevicemsg(taskCTL_t * pCTL, char * msgbody, uint32_t msglen); //send msglen bytes from msgbody; 

		//!!TODO fix this kludge (e.g. of making an assembly functions address into a uint32_t * so it will get passed)
		extern uint32_t USART1_msgctl;	//what actually gets passed is (*USART1_msgctl)() 
		extern uint32_t USART3_msgctl;	//	because we haven't figured out away to decorate the assembly language functions address	

		int MSG_post_fn(taskCTL_t * pCTL, uint32_t *pMSGctl, void *pcontent, uint32_t msgcount);
		// pCTL is a device data pointer
		// pMSGctl is pointer to struct controlling linked list of messages for a channel
		// pcontent is the pointer to an array of bytes to be sent
		// msgcount is the number of bytes to be sent
		//returns 0 if message has been placed in queue, returns >0 if previous message from same device is still in queue

		//useful system values
		extern uint32_t SysTick_absmsecs;
		extern uint32_t SysTick_msecs;
		extern uint32_t SysTick_secs;
		
	#endif //assembly or C specializations
	
#endif //MoT definitiona
		
