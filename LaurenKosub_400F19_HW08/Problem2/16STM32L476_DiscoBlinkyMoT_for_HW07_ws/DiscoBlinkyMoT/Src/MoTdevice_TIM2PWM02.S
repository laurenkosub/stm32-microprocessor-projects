@; MoTdevice_TIM2PWM02.S wmh 2019-10-16 : add pulsewidth reporting feature
@; MoTdevice_TIM2PWM.S wmh 2019-10-16 : MoT device for controlling a PWM servo
@; A hobby servo such as the Tower Pro SG92R is controlled with 0.5 - 2.5 msec duration pulses at 50 Hz.
@; Here we use in PWM mode to output pulses from TIM2 channel 1 on the STM32l476-Discover's PA0 

@------------------ constant and macro definitions

	#define __ASSEMBLY__
	#include "MoT_system/MoT_definitions.h"
	/* macros defined in 'MoT_definitions.h' 
		.macro MOV_imm32 reg, constant
		.macro LINK_me	mydata, myXEQ 	@;used by commands to install a device task on the task list
		.macro UNLINK_me mydata  		@;used by tass to remove temselves from the tasklist	
		.macro RELINK_me newXEQ			@;used by tasks to designate a follow-on task
		.macro MSG_post msgchannel, mydata, msgtext, msglength	@;used commands and tasks to put a message on a message queue
	*/	
	
	
@;-------------------------- data and code	

	.syntax unified				@; ARM Unified Assembler Language (UAL) is allowed 
	.thumb						@; here we're use thumb instructions only

	.bss						@;start of RAM data -- all zeroed by startup (!!important that all be zero at start)
	.align 2					@;data is all word so should be on word-boundary; 
	.global MoTdevice_TIM2PWM_data 		@;for visibility in debug
MoTdevice_TIM2PWM_data:	@;origin of TIM2PWM data structure 
	@;------ system variables of device: the required part of every device's data structure. Accessed by offsets .equ'd at top
	@;	.global MoTdevice_TIM2PWM_XEQ, MoTdevice_TIM2PWM_NEXT, MoTdevice_TIM2PWM_PREV 	@;global labels to make visible in debugger
	@;	.global MoTdevice_TIM2PWM_MSGPTR, MoTdevice_TIM2PWM_MSGCOUNT, MoTdevice_TIM2PWM_MSGLINK	
	@; using '.skip' to guarantee placement
	MoTdevice_TIM2PWM_XEQ: 		.skip 4		@; offset XEQ holds task-resume address (standard for all tasks)
	MoTdevice_TIM2PWM_NEXT:		.skip 4		@; offset NEXT holds link-address of next element in Tasklist (standard for all tasks)
	MoTdevice_TIM2PWM_PREV:		.skip 4		@; offset PREV holds link-address of previous element in Tasklist (standard for all tasks)		
	MoTdevice_TIM2PWM_MSGPTR:	.skip 4		@;pointer to this message's next character to print
	MoTdevice_TIM2PWM_MSGCOUNT:	.skip 4		@;count of remaining number of characters of message to print	
	MoTdevice_TIM2PWM_MSGLINK:	.skip 4		@;pointer to data structure of next device with a message (if any)
		
@;------ variables specific to TIM2PWM: optional part of device data structure for  TIM2PWM device (not urrently used)
	.global MoTdevice_TIM2PWM_pulserate, MoTdevice_TIM2PWM_pulsewidth,MoTdevice_TIM2PWM_pulseramp,MoTdevice_TIM2PWM_msgbuffer  @; 
	MoTdevice_TIM2PWM_pulserate: 	.skip 4	 	@;Holds a copy of TIM2 ARR reload value. Sets pulse rate. 						
	MoTdevice_TIM2PWM_pulsewidth:	.skip 4		@;current value of  downcount used to determine blink rate (special for this task)
	MoTdevice_TIM2PWM_pulseramp:	.skip 4		@;current value of  downcount used to determine blink rate (special for this task)
	MoTdevice_TIM2PWM_msgbuffer:	.skip 64	@;staging area for building messages with variable contents
	
	@;local TIM2PWM offset definitions
	.equ PULSERATE,(MoTdevice_TIM2PWM_pulserate - MoTdevice_TIM2PWM_data)
	.equ PULSEWIDTH,(MoTdevice_TIM2PWM_pulsewidth - MoTdevice_TIM2PWM_data)
	.equ PULSERAMP,(MoTdevice_TIM2PWM_pulseramp - MoTdevice_TIM2PWM_data)
	.equ MSGBUFFER,(MoTdevice_TIM2PWM_msgbuffer - MoTdevice_TIM2PWM_data) 
	
	.text
@;------ TIM2PWM device dispatch
	.global MoTdevice_TIM2PWM_cmd	
	.thumb_func					
MoTdevice_TIM2PWM_cmd: @;Cmd_handler() branches here after identifying a valid command with device ID = 'TIM2PWM'
	push {r7,lr}		@;this 'push' is balanced with a 'pop' at exit of each of the command routines of the dispatch table below
	ldrb r1,[r0],#1		@;read function code from the command buffer and advance r0 to point to the command's argument list (if any) 
	and r1,0x03			@;limit range of function codes to 0-3 for safety (error-checking would be nice but isn't done here)	tbb [pc,r1]
	@; TIM2PWM function byte meanings
	@;	0: install - initialize TIM2PWM hardware and data 
	@;	1: report current pulse width value
	@;	2: set pulse width
	@;	3: set target pulse width and pulse width delta

	tbb [pc,r1]
MoTdevice_TIM2PWM_cmd_table:
	.byte (MoTdevice_TIM2PWM_init - MoTdevice_TIM2PWM_cmd_table)/2	  	@;function 0: initialize hardware command
	.byte (MoTdevice_TIM2PWM_report - MoTdevice_TIM2PWM_cmd_table)/2	@;function 1: reads and reports current pulsewidth value
	.byte (MoTdevice_TIM2PWM_setpulse - MoTdevice_TIM2PWM_cmd_table)/2	@;function 2: change pulsewidth to new argument's value
	.byte (MoTdevice_TIM2PWM_ramppulse - MoTdevice_TIM2PWM_cmd_table)/2	@;function 3: change pulsewidth by steps to new value
	.align 1 @;!!important to do this where odd-byte alignment is possible 

@;------ TIM2PWM commands 
	@; commands below are dispatched by Cmd_Handler() in main() using the tbb (above) on the command's function number
	@; commands on entry have r0 pointing to the 'argument' (if any) of the command

	.global TIM2PWM_init	@;taskID=1, function number=0		
	.thumb_func
TIM2PWM_init: @;ordinary function for debug. This can be called as a void-void function from anywhere
	push {r7,lr}	@;
	@; NVIC, timer, and port pin initializations
	bl TIM2_NVIC_init
	@;set initial pulse values
	MOV_imm32 r3,MoTdevice_TIM2PWM_data
	MOV_imm32 r0,19999
	str r0,[r3,#PULSERATE]
	MOV_imm32 r0,9999
	str r0,[r3,#PULSEWIDTH]
	mov r0,#1
	str r0,[r3,#PULSERAMP]
	bl TIM2_init	
	bl TIM2_CH1_out_to_PA0
	pop {r7,pc}								
	
	.global MoTdevice_TIM2PWM_init	@;taskID=1, function number=0		
	.thumb_func
MoTdevice_TIM2PWM_init: @; arrive here from Cmd_Handler with r0 pointing to function arguments if any (this function does not have arguments) 
	@; NVIC, timer, and port pin initializations
	bl TIM2_NVIC_init
	@;set initial pulse values
	MOV_imm32 r3,MoTdevice_TIM2PWM_data
	MOV_imm32 r0,19999
	str r0,[r3,#PULSERATE]
	MOV_imm32 r0,9999
	str r0,[r3,#PULSEWIDTH]
	mov r0,#1
	str r0,[r3,#PULSERAMP]
	bl TIM2_init
	bl RedLED_init
	bl TIM2_CH1_out_to_PA0	@;TODO figure out where we used to do this

	@; post new TIM2PWM message on list 
	MSG_post USART2_MsgPost, MoTdevice_TIM2PWM_data, TIM2PWM_init_msg, TIM2PWM_init_msglen
	@; here with r0=0 if message got posted, =-1 if not. Ignored for now. 

	pop {r7,pc}								@;this 'pop' is balances the 'push' done at 'MoTdevice_TIM2PWM_cmd:". Returns to Cmd_Handler


	.global MoTdevice_TIM2PWM_report	
	.thumb_func
MoTdevice_TIM2PWM_report: @;build report string in msgbuffer, dispatch message handler

	@;copy message string to report buffer
	MOV_imm32 r0,MoTdevice_TIM2PWM_msgbuffer	@;dest
	adr r1,TIM2PWM_report_msg					@;source
	MOV_imm32 r2,TIM2PWM_report_msglen			@;count
	bl bytecopy									@;copy message
	@;here with r0 pointing to end of copied message string
	MOV_imm32 r1,0x40000034 					@;read value from timer 2 capture/compare register (&TIM2_CCR1 = 0x40000034)
	ldr r1,[r1]									@; ..
	@;place ASCII numeric of value CCR1 value in r1 at end of message string
	bl sprintf_uint32
	@;here with r0 pointing to end+1 of message
	movw r1,#(0x0D0A)							@;add CRLF to end of message
	strh r1,[r0],#2								@; ..
	@;here with message completed, r0 pointing to end+1
	MOV_imm32 r3,MoTdevice_TIM2PWM_data			@;begin preparation for giving message to handler
	ldr r1,[r3,#MSGLINK]						@;is a message from this task on the message list already ?
	cbnz r1,1f									@;	yes -  abort posting and report failure
	@;here if ok to post
	MOV_imm32 r1,MoTdevice_TIM2PWM_msgbuffer	@;set message pointer
	str r1,[r3,#MSGPTR]							@; 	..
	sub r2,r0,r1								@;calculate message bytecount
	str r2,[r3,#MSGCOUNT]						@;  and set it
	@;here with data structure prepared for posting message
	mov r0,r3									@; prepare for MsgPost((void *devicedata))
	bl USART2_MsgPost							@;  and go
	@; here with r0=0 if message got posted, =-1 if not. Ignored for now. 
	pop {r7,pc}								@;this 'pop' is balances the 'push' done at 'MoTdevice_TIM2PWM_cmd:". Returns to Cmd_Handler

	.global MoTdevice_TIM2PWM_setpulse @;instant change of pulsewidth to new value		
	.thumb_func
MoTdevice_TIM2PWM_setpulse: @; arrive here from Cmd_Handler with r0 pointing to 32bit update function argument
	@;set new pulse values
	ldr r0,[r0]								@;get new pulse width from commandline
	MOV_imm32 r3,MoTdevice_TIM2PWM_data		@; record it
	str r0,[r3,#PULSEWIDTH]					@; ..
	bl TIM2_CH1_pulse_update				@; then change TIM2PWM CCR1 (done before message so r0 is valid)
	MSG_post USART2_MsgPost, MoTdevice_TIM2PWM_data, TIM2PWM_setpulse_msg, TIM2PWM_setpulse_msglen
	pop {r7,pc}								@;this 'pop' is balances the 'push' done before MoTdevice_TIM2PWM_cmd_table dispatch; returns to Cmd_Handler

	.global MoTdevice_TIM2PWM_ramppulse
	.thumb_func
MoTdevice_TIM2PWM_ramppulse: @;changes pulsewidth target; TIM2 interrupt will then adjust CCR1 to match new value	
	@; change in pulse width value recorded here is effected step-wise in the the TIM2 pulse interrupt
	MOV_imm32 r3,MoTdevice_TIM2PWM_data
	ldr r1,[r0],#4			 				@;record target pulsewidth
	str r1,[r3,#PULSEWIDTH]					@; ..
	ldr r1,[r0]								@;record pulse increment (amount pulse width should change at each pulse)
	str r1,[r3,#PULSERAMP]	
	MSG_post USART2_MsgPost, MoTdevice_TIM2PWM_data, TIM2PWM_ramppulse_msg, TIM2PWM_ramppulse_msglen
	pop {r7,pc}								@;this 'pop' is balances the 'push' done at 'TIM2PWM:". Returns to Cmd_Handler
 
@;------ TIM2PWM messages and message length calculations
	TIM2PWM_init_msg:
	.ascii "TIM2PWM installed\n\r"
	.equ TIM2PWM_init_msglen,( . - TIM2PWM_init_msg)
	
	TIM2PWM_report_msg:
	.ascii "TIM2PWM pulse width= "
	.equ TIM2PWM_report_msglen,( . - TIM2PWM_report_msg)
	
	TIM2PWM_setpulse_msg:
	.ascii "TIM2PWM pulse width updated\n\r"
	.equ TIM2PWM_setpulse_msglen,( . - TIM2PWM_setpulse_msg)

	TIM2PWM_ramppulse_msg:
	.ascii "TIM2PWM pulse change starting\n\r"
	.equ TIM2PWM_ramppulse_msglen,( . - TIM2PWM_ramppulse_msg)

	.align 1 @;!!important to do this wherever we have inline messages ! 
	@;not doing this when putting text inline with code will randomly lead to 'Error: unaligned opcodes detected in executable segment'
	







