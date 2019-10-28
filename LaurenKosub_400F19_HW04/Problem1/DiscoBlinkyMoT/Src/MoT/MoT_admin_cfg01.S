@;MoT_admin_cfg01.S wmh 2019-06-14 : data structures controlling admin capabilities and operations
@; association of admin structures and functions with a communication channel is done by init_Cmd_handle() in main()

	#define __ASSEMBLY__
	#include "MoT_definitions.h"
 
	.syntax unified				@; ARM Unified Assembler Language (UAL). 
	.thumb						@; use thumb instructions only

	
@;===================== task list
	.data						@;important that this is in .data in order to be initialized at startup
	.align 2

	
@;define and initialize empty admin task list
	.global adminTasklist
adminTasklist:	
	.word NULL					@;at offset XEQ: root has no execution behavior
	.word adminTasklist_last	@;at offset NEXT: nothing between root and last when starting
	.word NULL					@;at offset PREV: no predecessor
	.word NULL					@;at offset C_startingSP; used to restore stack pointer after C tasks have run				

@; !! to create task(s) which run at system startup, place the tasks' data structures here and link them into this list
	
	.global adminTasklist_last
adminTasklist_last:	
	.word do_tasks_return		@;at offset XEQ: back to do_tasks caller
	.word NULL					@;at offset NEXT: nothing after last
	.word adminTasklist			@;at offset PREV: nothing between last and root when starting 
	
	.global adminMsgctl
adminMsgctl:
	.word	USART2_nbputchar	@; at offset NBTX_FUNC
	.word 	NULL				@; at offset MSGHEAD_PTR
	.word	NULL				@; at MSGTAIL_PTR


/*	
	.global adminCmd_channel
adminCmd_channel:
	.word USART1_RXgetbuf0		@; at offset MSG_RXDATA
	.word NULL					@; at offset MSG_TXENAB ??
	.word NULL					@; at offset MSGLIST_HEAD
	.word NULL					@; at offset MSGLIST TAIL
*/
	
	
@;	.equ C_startingSP,12		@; offset in admin/userTasklist where starting SP is stored !!now in "_MoT_definitions.h"
	
@;===================== runtime data	

	.bss						@;put in .bss so initialized to 0 at runtime
	.align 2
	
@; Cmd_handle data structure definitions and relative offsets -- !! put all of this in section .data and initialize it a compile-time ==> no need for 'init'
@;	.align 2
	.skip 32					@; allocation for struct elements defined in "_MoT_definitions.h"
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
	.word MoTdevice_GreenLED_cmd@; init= :0100FF fast= :0101FE slow= :0102FD stop= :0103FC 
@;	.word RedLED				@; init= :0200FE fast= :0201FD slow= :0202FC stop= :0203FB
@;	.word TIM2_PWM				@; 
@;	.word deviceESP8266
	@; *** other device entry points to follow here when they are developed ***