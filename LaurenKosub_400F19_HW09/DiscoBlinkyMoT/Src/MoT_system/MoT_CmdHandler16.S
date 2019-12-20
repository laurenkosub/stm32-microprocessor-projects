@; MoT_CmdHandler16.S rename of Cmd_Handler16.S
@; Cmd_Handler16.S wmh 2019-06-11 : separating admin and user data structs from Cmd_Handler code and putting them in adminContext.S and userContext.S 
@; Cmd_Handler15.S wmh 2019-06-11 : connecting USART3 to Cmd_handler()
@; Cmd_Handler14.S wmh 2019-06-11 : integrating Cmd_handler(Cmd_handle *) with do_tasks.  Adding tasklist head/tail to Cmd_handle. 
@; Cmd_Handler13.S wmh 2019-06-10 : Cmd_Handler() becomes Cmd_Handler(Cmd_handle *) to allow different control channels and levels of control
@; Cmd_Handler12.S wmh 2019-06-06 : replacing call to nbUSART1_getchar() with call to USART1_RXgetbuf0() is the only change to Cmd_Handler11.S
@; Cmd_Handler11.S wmh 2019-04-10 : adds suspend_Ctask, LINK_Ctask, UNLINK_Ctask, REDIRECT_Ctask functions
@; Cmd_Handler10.S wmh 2018-11-04 : improved name for the same code 
@; CoMul_dispatcher09.S wmh 2018-11-04 : adds dispatcher for serial command inputs to the cooperative multitasker
@; CoMul_dispatcher08.S wmh 2018-10-27 : dispatcher for serial command inputs to the cooperative multitasker
@;  - linked list of active tasks for better fit to embedded system problem (=single 'user' with predefined fixed set of device 'tasks')  
@;  - stateful coroutine 'Cmd_Handler()' running in alternation with stateful coroutine 'do_tasks()' rather than called by do_tasks() (r4 = rTASKP, r5= rCMDP)
@;	- command dispatching by branch (instead of call) from Cmd_Handler() for return back to main() ==> do_tasks() runs after each command.
@;	- task dispatching by call (instead of branch) from do_tasks()
@;	- commands self-install (add to Tasklist) their tasks; tasks can self-deinstall. 
@;	- all task's data structures are preallocated and initialized at system startup
@;	- buffered comm -- Cmd_Handler() gets commands from a message buffer rather than directly from comm port. 
@;  - smart Tasklist :  doubly linked list (PREV, NEXT) with permanent LAST task element;  LAST executes return to main()
@;	- mandatory task data structure starts with three words -- TASKp (coroutine resume addr), NEXTp, PREVp (list links), followed by anything else. 
@;	- thought: task's data initializations could be 'automatic' if task's record was in .data . !! a startup Tasklist in .data could be done this way!  
@;  - TODO: get commands by serial interrupt; make command buffer a ring buffer; add a new coroutine for sending messages to PC


/* 	Each device 'owns' a static data structure at its 'mydata' address
	struct 'mydata' {	
							void (*this_device)(void);		//resume-execution address of the device
							void *next;						//address of the next device's 'mydata'
							void *prev						//address of the previous device's 'mydata'
							...								// everything else the device needs to store
						}
	The Tasklist is a linked list of currently active devices. Linking and unlinking tasks is slightly harder than storing the task resume address in an array
	but now we always only scan 'live' tasks and we will never outgrow the tasklist or queue because everything is pre-allocated and doesn't grow. 					
*/			
	#define __ASSEMBLY__
	#include "MoT_definitions.h"
 
	.syntax unified				@; ARM Unified Assembler Language (UAL). 
	.thumb						@; use thumb instructions only

	
@; ============ handy definitions
/* now in "MoT_definitions.h"	
	rTASKP 	.req r4		@;alias for r4 - current place in task list; system variable must be preserved through function calls, interrupts
	rCMDP	.req r5		@;alias for r5 - holds Cmd_Handler resume-address (e.g. command parse-state) 
	rMSGP	.req r6
	.equ EOF,-1
	.equ NULL,0

	@; offsets of standard variables in each task's control structure (what rTASKP points to)
	.equ XEQ,0				@; offset in the device's task control structure to the device's coroutine resume-execution address
	.equ NEXT,4				@; offset in the device's task control structure to the next device in the Tasklist
	.equ PREV,8				@; offset in the device's task control structure to the next device in the Tasklist
	.equ MSGPTR,12			@;will hold pointer to this message's next character to print
	.equ MSGCOUNT,16		@;will hold count of remaining number of characters of message to print
	.equ MSGLINK,20			@;will hold pointer to data structure of next device with a message (if any)
//	.equ DATAPTR,24			@;will hold pointer to task's own data
*/	

/* obsolete
	@;offsets of fields in the message control structure 'MSG_list'
	.equ FIRSTMSG,0
	.equ LASTMSG,4
*/	

/* now in "MoT_definitions.h"	 
	.macro MOV_imm32 reg, constant
		movw \reg, #:lower16:\constant
		movt \reg, #:upper16:\constant
	.endm
*/	
	
/*
	.macro LINK_me	mydata, myXEQ 	@; installs a device in the Tasklist
	@; this macro is placed at the exit of commands called from Cmd_Handler which install a device task on the task list
	@; 'mydata' is the address the task's data structure; task data structures are preallocated and optionally initialized at system startup
	@; 'myXEQ' is the device's execution-resume address.
	@; note: this macro is placed only at Cmd_Handler()'s exit point so we are free to use r0-r3 without consequences
	@; 
	MOV_imm32 r3,\mydata		@;pointer to this (new) device's task control structure in r3
	ldr r2,[r3,#XEQ]			@;check -- is this device already installed (
	cbnz r2,1f					@;  yes -- stop installation right now !!fix this if you can think of something better			
//	MOV_imm32 r2,Tasklist_root	@;pointer to the Tasklist origin in r2
	ldr r2,[rCMDP,#(TASKLIST)]	@;get task list origin
	ldr r1,[r2,#NEXT]			@;pointer to current first list element in r1
	MOV_imm32 r0,\myXEQ			@;pointer to the new device's entry point in r0
	str r0,[r3,#XEQ]			@; ..
	str r3,[r2,#NEXT]			@;link this device as new first on list
	str r3,[r1,#PREV]			@;link new first as previous of the old first
	str r1,[r3,#NEXT]			@;link old first as next of this device
	str r2,[r3,#PREV]			@;link list root as previous of this device
1:	@;installation skipped by jumping here from cbnz abovd
	.endm

@;------ macros used in MonT tasks
	.macro UNLINK_me mydata  	@; remove a device from the Tasklist
	@; this macro is placed at the exit of tasks which are removing themselves from the Tasklist
	@; removing a task from the Tasklist does not destroy the task's data so it could be part of a scheme to suspend rather than kill tasks
	@; because this is placed at the exit point back to main (via pop {r7,pc} ) we are free to use r0-r3
	@; 
	MOV_imm32 r3,\mydata		@;get address of (this device's) list element to be unlinked
	ldr r2,[r3,#PREV]			@;get element's predecessor in r2
	ldr r1,[r3,#NEXT]			@;get element's successor in r1
	str r1,[r2,#NEXT]			@;link old predecessor to old successor
	str r2,[r1,#PREV]			@;link old successor to old predecessor
	mov r0,#0					@; clear obsolete links
	str r0,[r3,#XEQ]			@; ..
	str r0,[r3,#NEXT]			@; ..
	str r0,[r3,#PREV]			@; ..
	.endm
		
	.macro RELINK_me newXEQ	@; redirect to another section of this device's routines
	@; this macro automates replacing the device task's resume address; 
	@; rTASKP points to the task's data element because we are in the task 
	MOV_imm32 r2,\newXEQ		@;get coroutine's entry address
	str r2,[rTASKP,#XEQ]		@; set up for next dispatch
	.endm
	

@;===================== task list
	.data
	.align 2

@;define and initialize user task list
	.global userTasklist
userTasklist:	
	.word NULL					@;at offset XEQ: root has no execution behavior
	.word adminTasklist_last	@;at offset NEXT: nothing between root and last when starting
	.word NULL					@;at offset PREV: no predecessor
	.word NULL					@;at offset C_startingSP; used to restore stack pointer after C tasks have run				
	
@; !! to create task(s) which run at system startup, place the tasks' data structures here and link them into list
	
	.global userTasklist_last
userTasklist_last:	
	.word do_tasks_return		@;at offset XEQ: back to do_tasks caller
	.word NULL					@;at offset NEXT: nothing after last
	.word adminTasklist			@;at offset PREV: nothing between last and root when starting 

	
@;define and initialize empty admin task list
	.global adminTasklist
adminTasklist:	
	.word NULL					@;at offset XEQ: root has no execution behavior
	.word adminTasklist_last	@;at offset NEXT: nothing between root and last when starting
	.word NULL					@;at offset PREV: no predecessor
	.word NULL					@;at offset C_startingSP; used to restore stack pointer after C tasks have run				

@; !! to create task(s) which run at system startup, place the tasks' data structures here and link them into list
	
	.global adminTasklist_last
adminTasklist_last:	
	.word do_tasks_return		@;at offset XEQ: back to do_tasks caller
	.word NULL					@;at offset NEXT: nothing after last
	.word adminTasklist			@;at offset PREV: nothing between last and root when starting 
	

	.equ C_startingSP,12		@; offset in admin/userTasklist where starting SP is stored
	
@;===================== runtime data	

@;define and initialize empty message list. !! DONE move this to (separate) copies in USART1 and USART3 interrupts -- we want tasks to be able to pst t either/both message channels
	.global MSG_list, MSGS_begin, MSGS_end
	MSG_list:
	MSGS_begin:	.word NULL	@;pointer to data of device with message underway or pending at offset FIRSTMSG
	MSGS_end: 	.word NULL	@;pointer to last message on list at offset LASTMSG

	.bss
	.align 2
	
@; Cmd_handle data structure definitions and relative offsets -- !! put all of this in section .data and initialize it a compile-time ==> no need for 'init'

// now in "MoT_definitions.h"
	.equ CMD_DEVICETABLE,(-4)	@;holds address of device dispatch table
	.equ CMD_SOURCE,(-8)		@;entry point of function reading serial input stream and returning command, byte by byte
	.equ MSG_DEST,(-12)			@;??
	.equ CMD_STATE,(-16)		@;holds address of resume-address of command parser
	.equ CMD_WRINDX,(-20)		@;offset in command buffer to location where next byte will be written
	.equ TASKLIST,(-24)			@;holds address of tasklist root

	.align 2
	.skip 32					@; allocation for above struct elements
	.global adminCmd_handle		@;control struct for admin commands
adminCmd_handle:				@; Cmd_handle trick (handle is pointer into middle of data structure with params before and data after)
	.skip 2500					@; !! TODO size of buffer for command parser output

	
	.text

	@;The 'Devicetable' contains addresses of the entry point of each task or command operation defined for the system. 
	@ Incoming commands start with an operation ID (opID). The opID*4 = offset into the table holding the operation's entry point
	@;Whether a opID arrives in a command from the controller (PC) or is part of a system initialization list, it is used to 
	@;	index into the task table and dispatch the code for that task or. command. 
	@;
	@; A 'Command' is an opID that is executed but doesn't leave a follow-on task in the Tasklist 
	@; A 'Task' is an opID  that leaves a residual task in the Tasklist
	@; When 'Cmd_Handler' decodes a command message and dispatches the associated operation, the operation starts with r0 pointing
	@; to the command's binary 'tail' containing any further information needed. Typically, the first entry in the command tail
	@; is a function number which directs what the command is supposd to do.  See 'GreenLED.S' for an example.  
	.global adminDevicetable	 @;holds pointers to Device dispatch code; in general admin and user have access to different devices
adminDevicetable:	
	.word Reset_Handler			@; Executing Reset_Handler restarts the system :0000
	.word GreenLED				@; init= :0100FF fast= :0101FE slow= :0102FD stop= :0103FC 
	.word RedLED				@; init= :0200FE fast= :0201FD slow= :0202FC stop= :0203FB
//	.word hello_USART3			@; initial testing of USART3-8266 interface
	@; *** other device entry points to follow here when they are developed ***

*/
	.global init_Cmd_handle @;initialize command buffer indexes, set entry point at Cmd_wait_for_startchar(), link Cmd_handle to device function
	.thumb_func
init_Cmd_handle:			@;void init_Cmd_Handler(Cmd_handle *, Device_table *, (*Cmd_source)(), Tasklist_root *)
	@;Cmd_buf is where commands are received and interpreted. New commands re-zero the buffer
	mov rCMDP,r0
	str r1,[rCMDP,#(CMD_DEVICETABLE)]	@;command dispatch table
	str r2,[rCMDP,#(CMD_SOURCE)]		@;address command communication channel struct
	str r3,[rCMDP,#(TASKLIST)]			@;tasklist head
reset_Cmd_handle: @;local entry point for use in Cmd_Handler. Entry here assumes rCMDP is valid
	MOV_imm32 r1,Cmd_wait_for_startchar
	str r1,[rCMDP,#(CMD_STATE)]
	mov r1,#0					
	str r1,[rCMDP,#(CMD_WRINDX)]
	bx lr						@;back to caller 
	
	.global Cmd_Handler 		@;void Cmd_Handler(Cmd_handle *); //parses commands received on 
	.thumb_func
Cmd_Handler: 					@;called in main()'s while(1)
	@;this is the common entry point for dispatching Cmd_Handler-states
	push {r7,lr}				@; registers saved will be restored by each Cmd_Handler state
	mov rCMDP,r0				@; Cmd_handle in rCMDP
	ldr r0,[rCMDP,#(CMD_STATE)]	@; address of an entry point in Cmd_Handler in r0
	bx r0						@; dispatch to the current state of Cmd_Handler

	.thumb_func
Cmd_wait_for_startchar:			@;here with Cmd_handle in rCMDP
	ldr r0,[rCMDP,#(CMD_SOURCE)]@;dispatch to function providing command stream
	blx r0						@; returns r0 >= 0 if char, return <0 if no new value
	cmp r0,#(':')				@;
	beq	Cmd_have_startchar
	@; here if start char was not received
	b run_tasks					//was pop {r7,pc}

Cmd_have_startchar: @; here when start char wss received
	@; reinitialize command-buffer control values
	mov r2,#0					@;initialize counters
	str r2,[rCMDP,#CMD_WRINDX]	@;
	MOV_imm32 r0,Cmd_get_msg_evenchar @;try again later
	str r0,[rCMDP,#(CMD_STATE)] 

	@; fall through to start command  acquisition task 

	.thumb_func
Cmd_get_msg_evenchar:			@;message bytes all consist of a pair (even:odd) of hex ASCII bytes
	ldr r0,[rCMDP,#(CMD_SOURCE)]@;dispatch to function providing command stream
	blx r0						@; returns r0 >= 0 if char, return <0 if no new value
	cmp r0,#0
	bgt Cmd_have_evenchar		@;we've received a new character
	@; here if nothing was received
	b run_tasks					// was pop {r7,pc}

Cmd_have_evenchar:				@; here when there's a new character
	cmp r0,#0x0A				@;test for newline (= end-of-message) of various flavors
	beq	Cmd_have_endchar		@; ..
	cmp r0,#0x0D				@; ..
	beq	Cmd_have_endchar		@; ..
	@; here if character was not end-of-message
	ldr r2,[rCMDP,#CMD_WRINDX]		@;get offset to current write-location in the command buffer
	@;convert message character to binary and save value 
	@;no error checking -- assumes all message characters are legal hex ASCII 0-9 A-F
	cmp r0,#('9')				@;check if hi nybble character is 9 or below
	ite LS						@;	..
	subLS r0,#('0')				@;	if yes -- adjust for numeric '0' - '9' 
	subHI r0,#('A'-10)			@;  else adjust for alpha 'A' - 'F'
	lsl r0,#4					@;	save binary hi nybble value
	strb r0,[rCMDP,r2]			@;  ..	

	@;prepare parser to look for odd character
	MOV_imm32 r0,Cmd_get_msg_oddchar @;try again later
	str r0,[rCMDP,#(CMD_STATE)] 
	@; fall through to odd char acquisition task 
	
	.thumb_func
Cmd_get_msg_oddchar:			@;message bytes all consist of a pair (even:odd) of hex ASCII bytes
	ldr r0,[rCMDP,#(CMD_SOURCE)]@;dispatch to function providing command stream
	blx r0						@; returns r0 >= 0 if char, return <0 if no new value
	cmp r0,#0
	bgt Cmd_have_oddchar
	@; here if nothing was received
	b run_tasks					//was pop {r7,pc}

Cmd_have_oddchar: @; here if something was received 
	cmp r0,#0x0A				@;test for newline of various flavors !!newline here would be an error
	beq	Cmd_error_exit			@; ..
	cmp r0,#0x0D				@; ..
	beq Cmd_error_exit			@; ..
	
	@; here if character was not end-of-message
	ldr r2,[rCMDP,#CMD_WRINDX]						@;get offset to current write-location in the command buffer
	@;convert message character to binary (assumes all message characters are legal hex ASCII 0-9 A-F
	cmp r0,#('9')		
	ite LS						@;	check if lo nybble's value is 9 or below
	subLS r0,#('0')				@;	if yes -- adjust for numeric '0' - '9' 
	subHI r0,#('A'-10)			@;  else adjust for alpha 'A' - 'F'		
	ldr r1,[rCMDP,r2]				@;get previously converted hi nybble value of this byte 
	add r1,r0					@; add lo nybble to it
	strb r1,[rCMDP,r2]				@; and save it back
	adds r2,#1					@;  then update buffer pointer
	str r2,[rCMDP,#CMD_WRINDX]		@; ..

	@;prepare parser to look for even character next
	MOV_imm32 r0,Cmd_get_msg_evenchar @;try again later
	str r0,[rCMDP,#(CMD_STATE)] 
	b Cmd_get_msg_evenchar 
	
Cmd_have_endchar: @;here from Cmd_build_msg_even_char when '\n' (x0D or 0x0A) of message was received 
	ldr r2,[rCMDP,#CMD_WRINDX]		@;r2 holds offset to end+1 of message body
	cmp r2,#0
	beq Cmd_error_exit			@; message body is empty

	@; ok so far, now do the checksum. rCMDP still holds bufhandle
	add r2,rCMDP,r2				@;r2 now holds address of end+1 of message body in buffer
	mov r3,rCMDP				@;r3 points to origin of command message in buffer
	movs r0,#0					@;initialize checksum value (also clears carry, but we don't worry about carry because we are adding bytes to words)
Cmd_accumulate_checksum:
	ldrb r1,[r3],#1				@;read a byte from the command
	adds r0,r1					@; and accumulate to the checksum 
	cmp r3,r2					@;have we reached the end of the command?
	blo Cmd_accumulate_checksum @;	no -- 
	@;here when all bytes of message have been accumulated to checksum
	and r0,0xFF					@;checksum is low 8 bits only
	cmp r0,#0
	bne Cmd_error_exit

	@;here with a valid command string at Cmd_handle
Cmd_dispatch:	@;!!TODO -- check dispatch code against the length of Devicetable
	@;here with a valid command in the buffer 
	mov r0,rCMDP				@;reset controls for next call to Cmd_handler
	bl reset_Cmd_handle			@; ..
	mov r0,rCMDP				@;r0 points to command string 
	ldrb r1,[r0],#1				@;device# in r1; r0 now points to devices's fn# in command buffer
	ldr r2,[rCMDP,#(CMD_DEVICETABLE)] @;device table origin in r2
	ldr r2,[r2,r1,LSL #2]		@;lookup command in Devicetable -- command execution address in r2
	blx r2						@;dispatch device / device function ; r0 points to device's fn# in the command buffer
Cmd_complete_exit:
	b run_tasks


Cmd_error_exit:	@;here if the message was empty or invalid (not hex ASCII or checksum fails) 
	@;!! TODO? : send NACK to controller to indicate some problem with the message
	mov r0,rCMDP				@;reset controls for next call to Cmd_handler
	bl reset_Cmd_handle			@; ..
	
run_tasks:
//	MOV_imm32 r3,Tasklist_root	@; point task pointer ('rTASKP'=r4) to 1st entry on task list
	ldr r3,[rCMDP,#(TASKLIST)]	@; get starting task pointer
	ldr rTASKP,[r3,#NEXT]		@;  rTASKP now points to the XEQ field of the 1st task on the task list
	str sp,[r3,#C_startingSP]	@; save starting sp (C tasks exit without cleaning up stack)
	ldr pc,[rTASKP]				@;  off we go to the first task on the task list. Ww'll return here after tasks have run
	@;returns through final task on list 'do_tasks_return' which does a pop {r7,pc}	back to main()'s while(1)

	.global do_tasks_return
	.thumb_func
do_tasks_return:				@;execution behavior of Tasklist_last
	ldr r3,[rCMDP,#(TASKLIST)]	@; get starting task pointer
	ldr sp,[r3,#C_startingSP]	@; restore starting sp (C tasks will have messed it up)
	pop {r7,pc}

	
