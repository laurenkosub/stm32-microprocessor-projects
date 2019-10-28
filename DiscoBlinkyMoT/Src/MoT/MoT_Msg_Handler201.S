@;MoT_Msg_Handler201.S wmh 2019-09-18 : deletes C message handling for now, adds admin communication channel to message control structure
@;Msg_Handler03.S wmh 2019-04-10 : adding messaging functions for C tasks and commands
@;Msg_Handler01.S wmh 2018-11-06 : begin development

	#define __ASSEMBLY__
	#include "MoT_definitions.h"
 
	.syntax unified				@; ARM Unified Assembler Language (UAL). 
	.thumb						@; use thumb instructions only

//	.equ Msg_nbputchar,USART2_nbputchar	@;!!TODO? put this and the below definitions in the header file
	
	@; system variable kept in register
//	rTASKP 	.req r4			@;holds current place in task list; valid in task, not valid in commands so don't use
/* now in MoT_definitions.h	
	@; offsets of standard variables in task's control structure 
	.equ XEQ,0				@; offset in the device's task control structure to the device's coroutine resume-execution address
	.equ NEXT,4				@; offset in the device's task control structure to the next device in the Tasklist
	.equ PREV,8				@; offset in the device's task control structure to the next device in the Tasklist
	.equ MSGPTR,12			@;will hold pointer to this message's next character to print
	.equ MSGCOUNT,16		@;will hold count of remaining number of characters of message to print
	.equ MSGLINK,20			@;will hold pointer to data structure of next device with a message (if any)

	.macro MOV_imm32 reg, constant
		movw \reg, #:lower16:\constant
		movt \reg, #:upper16:\constant
	.endm

	
*/	
	
	@;-------- message posting 
	@; Messages are posted by the macro MSG_post (below), which initializes some data then calls MSG_post_fn()
	@; IMPORTANT!! User code must prevent a device from posting more than one message at
	@; a time. Doing so will break the message list by making it circular.
	@;
	/*
	.macro MSG_post msgtext, msglength	@;inlined by device command or task to put a message in the message queue
		push {r0-r3}			@;make safe as a macro
		
		MOV_imm32 r1,\msgtext	@; ..
		str	r1,[rTASKP,#MSGPTR]	@; ..	
		MOV_imm32 r1,\msglength	@; ..
		str	r1,[rTASKP,#MSGCOUNT] @; ..
		bl MSG_post_fn			@; append this message to the message chain 
		
		pop {r0-r3}				@;restore and continue
	.endm
	*/
	
/*
	.global post_Cdevicemsg
	.thumb_func
post_Cdevicemsg: @; uint32_t post_Cdevicemsg(taskCTL_t * pCTL, char * msgbody, uint32_t msglen); //send msglen bytes from msgbody; returns 0 if message has been placed in queue, returns >0 if previous message from same device is still in queue
	@;called by Cdevice commands or tasks
	push {r7,lr}
	ldr r3,[r0,#MSGCOUNT]	@;is another message from this device still in the message queue?
	cbz r3,1f				@;  no -- put the message on the queue
	mov r0,r3				@;  yes -- abort sending and return count of existing message still not sent
	pop {r7,pc}				@; 	..
1:	@;here to add message to the message queue
	str r1,[r0,#MSGPTR]		@;store control values 
	str r2,[r0,#MSGCOUNT]	@; ..
	MOV_imm32 r3,Msgs_list	@;get pointer to message currently at head of message list
	ldr r2,[r3,#HEAD_PTR]	@;  in r2
	cbz r2,2f				@;if list is empty then new message at r0 is both first and last			
	@;here when there's at least one device message on the list 
	ldr r2,[r3,#TAIL_PTR]	@;r2 now points to  message at the tail of the message list
	str	r0,[r2,#MSGLINK]	@;  that device's message now chains to our device's message 
	str	r0,[r3,#TAIL_PTR]	@; and we become the last message
	b 3f
2: 	@;here if message queue is empty	
	str r0,[r3,#HEAD_PTR]	@;make this message first on the list
	str r0,[r3,#TAIL_PTR]	@; and also last

3:	mov r1,#0				@; zero the new message's 'next message' link 
	str	r1,[r0,#MSGLINK]	@; .. 

	mov r0,#0				@; returning 0 signals "message is in queue" 

 	pop {r7,pc}				@;  back to C device
*/	
	
	
	
	
	@;----------------------------------------------------------------------
	.data
	
	.align 2		@;data is all word so should be on a word-boundary; 
	@; ---- system data. holds pointers to head and tail of message list
/* now  a struct in main()
	.global adminMsg_ctl
adminMsg_ctl: @;system data. holds execution address of TX fn, pointers to head and tail of message list
	admin_nbTX:			.skip 4		
	admin_Msgshead: 	.skip 4
	admin_Msgs_tail: 	.skip 4
*/	
	
	@;------------------------------------------------------------------------	
	.text

	
	@; -------------- message posting function

	.global MSG_post_fn @; place a message in a message queue
	.thumb_func
MSG_post_fn: @;void _MSG_post_fn(void *msgchannel_handle, void *devicedata) appends a command or task message to a message list. 
@; low-level function designed to be called by Msg_post macro from within device command or task 
	push {r7,lr}

	@;arrive with r0 pointing to msgchannel_handle, r1 pointing to device_data of message poster
	ldr r2,[r0,#MSGHEAD_PTR]				@;get pointer to message at head of msgchannel queue in r2
	cbz r2,1f								@;if message queue is empty then new message is both first and last			
	@;here when there's at least one message in the queue
	ldr r2,[r0,#MSGTAIL_PTR]				@;r2 now points to device_data of the message at the tail of the message queue
	str	r1,[r2,#MSGLINK]					@;store pointer to our device_data in the device_data of the current last in queue
	str	r1,[r0,#MSGTAIL_PTR]				@; and we become the last message in the queue
	b 2f
1: 	@;here if message queue is empty	
	str r1,[r0,#MSGHEAD_PTR]				@;store pointer to our device_data to make our message first in the queue
	str r1,[r0,#MSGTAIL_PTR]				@; and also last

2:	mov r0,#0								@; zero our message's 'next message' link because we are now last in queue
	str	r0,[r1,#MSGLINK]					@; .. 

 	pop {r7,pc}								@;  back to 'Msg_post' macro

	
	.global Msg_Handler_init 				@;clear any messages waiting on the message list, reset list to empty
	.thumb_func
Msg_Handler_init: @;void Msg_Handler_init(void *msgchannel_handle, int (*nbTXfn)(uint8_t c);
	str r1,[r0,#NBTX_FUNC]
	mov r1,#0
	str r1,[r0,#MSGHEAD_PTR]
	str r1,[r0,#MSGTAIL_PTR]		
	bx lr					

	.global Msg_Handler @; coroutine executing round-robin with do_tasks()
	@; tries to send a character from the current message string each time it runs;
	@; loads the next message string in MSGLINK when the current string is empty
	.thumb_func
Msg_Handler: @;message* Msg_Handler(void *msgchannel_handle); //called in main()'s while(1)
	push {r7,lr}
	
	mov r3,r0								@;msgchannel_handle in r3
	ldr r2,[r3,#MSGHEAD_PTR]				@;get link to data structure of current message
	@;-- here with r2=0 if no messages, else r2 now points to device_data of the message
	cbz r2,1f								@; list is empty, so leave
	
2:	@;(future) might loop here in the case where multiple characters of the message might be sent at once
	.global Msg_sender	@;global for debugger visibility
	.thumb_func							
Msg_sender:  @; here to send next character of message; removes message from list when they have been sent
	@;here with r2=address of device_data struct holding message, r3=address of msgchannel_handle struct
	ldr r1,[r2,#MSGPTR]						@;r1 points to next message character
	ldrb r0,[r1],#1							@;  next message character in r0 
	@;attempt to send message character
	push {r2,r3}							@;save for use on return from nbTXfn()
	ldr r2,[r3,#NBTX_FUNC]					@;address of nbTXfn() in r2
 	blx r2									@;nbTXfn() returns +1 if char sent, -1 if fail to send
	pop {r2,r3}								@; restore pointers to current device_data and msgchannel_handle
	subs r0,#1								@;check if function's return in r0 =1 (character was sent)
	cbnz r0,1f								@;  send was blocked, so done for now -- leave (nothing is changed)
	@;here if the character was sent. r2=address of devicedata struct, r3=address of msgchannel_handle struct
	str r1,[r2,#MSGPTR]						@;update message pointer
	ldr r1,[r2,#MSGCOUNT]					@;update message count and test if =0
	subs r1,#1								@; (sets ZF if count reached 0)
	str r1,[r2,#MSGCOUNT]					@; .. 
@;	bne 2b	@; when burst-sending, attempts to send the nextcharacter of the message
	@; -- here with r2=address of device data structure containing the message control variables 
	bne 1f									@; message not done-- initially we'll only send one character at a time
	@;here if message count has reached 0 (message done)
	mov r1,#0								@;make MSGPTR=0 (MSGCOUNT alreeady is 0 from above)
	str r1,[r2,#MSGPTR]						@; ..
	@;here to remove msg link of this message from list
	ldr r0,[r2,#MSGLINK]					@;get address (if exist) of next message in list in r0
	str r1,[r2,#MSGLINK]					@;  then clear (write NULL) to this device's link
	mov r2,r0								@; maintain consistent meaning for r2 as address of device data structure
	cbz r2,3f								@;if link was null then list is empty so reset the list pointers to NUL 
	@;here when another message follows this one on the list -- make it new first on list
@;	MOV_imm32 r3,Msgs_list					@; unnecessary/duplicative -- done 'just in case'
	str r2,[r3,#MSGHEAD_PTR]				@;make this message's next message the new first message
	@; -- here with r2=address of next device data structure containing a message
	b 1f
@;	b 2b  @; when burst-sending, attempts to start the next message on the list

3:  @;here if no more messages on list ( r2=0 )		
	str r2,[r3,#MSGHEAD_PTR]					@;mark message list as empty
	str r2,[r3,#MSGTAIL_PTR]					@; ..
	
1:	@;here with r2=0 if nothing more to send, o.w. = address of device control array
	mov r0,r2								@;function returns address of continuing or new message, else returns 0 
	pop {r7,pc}								@;							

	
	
/*
	@;----------------------- test device message maker

	.data
	.align 2		@;data is all word so should be on word-boundary; 

	.global  phonyDEV_data	//empty phony device data for Msg_Handler test	
phonyDEV_data:	@;origin of  testDEV data structure
	.skip 24
	
	
	.text
	
	.global Msg_Handler_phony_post //toy post of message to test Msg_Handler
	.thumb_func
Msg_Handler_phony_post:
	push {r7,lr}
	@;phony message needs phony task
	@;initialize message control  for this 'task'
	MSG_post phonyDEV_data, phonyDEV_msg,(phonyDEV_msg_end - phonyDEV_msg)
	pop {r7,pc}

	@; DEV_initmsg is stored in FLASH (below)
	@; 
 phonyDEV_msg:
	.ascii "1234567890\n" 
 phonyDEV_msg_end:
	.align 1 @;!!important to do this ! 
	@;not doing this when putting text inline with code will randomly lead to 'Error: unaligned opcodes detected in executable segment'
*/
