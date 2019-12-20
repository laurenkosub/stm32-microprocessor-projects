//ringbufbuf03.S wmh 2019-07-10 : adds reset functions ringbufbuf0_reset() and ringbufbuf0_reset()
//ringbufbuf02.S wmh 2019-06-07 : update for use with Msg_Handler and TX interrupt. 
//ringbufbuf01.S wmh 2019-06-04 : create an 'interrupt safe' ringbuffer for RX interrupt, having two read pointers for different uses of the received data 
//ringbuffer03.S wmh 2019-03-13 : adds 'overruns' counter to buffer structure
//ringbuffer02.S wmh 2019-03-10 : ringbuffer using pointer-compare instead of count 
// Because the write operation is interrupt driven while the read operation is not, a critical region exists 
// around the count update. (I think) this problem goes away when pointer comparison is used. 
// When rdindex==wrindex the buffer is empty -- you can write but should not read.
// If after writing the updated wrindex==rdindex then the buffer is full so rdinde should be incremented (oldest data is lost)
 
//ringbuffer01.S wmh 2019-03-10 : ringbuffer module

	@; --- characterize target syntax, processor
	.syntax unified				@; ARM Unified Assembler Language (UAL). 
	.thumb						@; Use thumb instructions only

	@; Using a power of 2 can allow us to use masking rather than compare to wrap buffer
//	.equ BUFSIZE,(2048) 		@; !!this is (re)set by call to 		

@; --- global data memory
	.data
	.align 2

/* data structure below is defined in each interrupt routine
	.skip 2 //buf1 overrun count 
	.skip 2 //buf0 overrun count 
	.skip 2 //buf1 newline count
	.skip 2 //buf0 newline count
	.skip 4	//buf1 rdindex	
	.skip 4	//buf0 rdindex
	.skip 4 //buffer status
	.skip 4	//buffer max index (stored for fast access)
	.skip 4	//wrindex
USARTx_bufHANDLE:	//buffer 'handle' which is passed to buffer management functions; positive/negative offsets from handle give control/data values 
	.skip BUFSIZE	//buffer data
*/

	//constants below are offsets from 'handle' of data structure above argument for calls to buffer operations defined here
	//buffer-specific parameters' offsets (one set for each read-buffer)
	.equ BUF0_NUMOVERRUNS,-28	@; hword	
	.equ BUF1_NUMOVERRUNS,-26	@; ""
	.equ BUF0_NUMNEWLINES,-24	@; ""	
	.equ BUF1_NUMNEWLINES,-22	@; ""	
	.equ BUF0_RDINDEX,-20		@; word
	.equ BUF1_RDINDEX,-16		@; ""
	.equ BUF0_RDINDEX,-20		@; word
	.equ BUF1_RDINDEX,-16		@; ""
	.equ BUF_COUNT,-12			@; ""  number of unread characters remaining in primary buffer BUF0
	.equ BUF_MAXINDEX,-8		@; ""  stored here in buffer struct rather than loaded as a constant to give faster access
	.equ BUF_WRINDEX,-4			@; ""
	
	.text						@;start the code section
	
	.global ringbufbuf0_rd		@;called from a task or TX interrupt; reads a character from buffer0		
	.thumb_func
ringbufbuf0_rd:	@; int32_t ringbufbuf0_rd(uint8_t *bufHANDLE); //return -1 fail, 0-255 byte value from buffer, >255 info code?
//	push {r7,lr}				@;need for speed
	CPSID i						@;possible a critical region, depending on how called
	ldr r1,[r0,#(BUF0_RDINDEX)]	@;get buffer0 rdindex in r1
	ldr r2,[r0,#(BUF_WRINDEX)]	@;get wrindex in r2. Not a critical region here because at worst we miss a read opportunity (nb: this is a carryover from before we had BUF_COUNT)
	cmp r2,r1					@;is there any data left to read in ringbuffer (rdindex != wrindex )?
	bne 1f						@; yes -- go get it
	@;here when count=0 		@; no data -- return -1
	mov r0,#-1					@; ..
	CPSIE i						@; ..
	bx lr

1:	@;here if there's data to return
	ldr r2,[r0,BUF_COUNT]		@;decrement count of remaining data in primary buffer
	sub r2,#1					@; ..
	str r2,[r0,BUF_COUNT]		@; ..
	ldrb r2,[r0,r1]				@;get data at rdindex in r2
	adds r1,#1					@;update rdindex
	ldr r3,[r0,#(BUF_MAXINDEX)]	@; maxindex in r3
	subs r3,r3,r1				@; r3=maxindex-rdindex
	ite	eq						@; conditionally wrap index
	streq r3,[r0,#(BUF0_RDINDEX)]	@; rdindex has reached wrap around, so reinitialize rdindex (r3 is 0 from above subtraction)
	strne r1,[r0,#(BUF0_RDINDEX)]	@; buffer has not wrapped around so update rdindex with incremented value
	mov r0,r2					@;get return value= next value from ringbuffer
	CPSIE i						@;end of critical region
	bx lr						@;  and back

	.global ringbufbuf1_rd		@;called from a task; reads a character from buffer1		
	.thumb_func
ringbufbuf1_rd:	@; int32_t ringbufbuf1_rd(uint8_t *bufHANDLE); //return -1 fail, 0-255 byte value from buffer, >255 info code?
//	push {r7,lr}				@;need for speed
	CPSID i						@;possible critical region, depending on how called
	
	ldr r1,[r0,#(BUF1_RDINDEX)]	@;get buffer0 rdindex in r1
	ldr r2,[r0,#(BUF_WRINDEX)]	@;get wrindex in r2. 
	cmp r2,r1					@;is there any data left to read in ringbuffer (rdindex != wrindex )?
	bne 1f						@; yes -- go get it
	@;here when count=0 		@; no data -- return -1
	mov r0,#-1					@; ..
	CPSIE i						@; ..
	bx lr

1:	@;here if there's data to return
	ldrb r2,[r0,r1]				@;get data at rdindex in r2
	adds r1,#1					@;update rdindex
	ldr r3,[r0,#(BUF_MAXINDEX)]		@; maxindex in r3
	subs r3,r3,r1				@; r3=maxindex-rdindex
	ite	eq						@; conditionally wrap index
	streq r3,[r0,#(BUF1_RDINDEX)]	@; rdindex has reached wrap around, so reinitialize rdindex (r3 is 0 from above subtraction)
	strne r1,[r0,#(BUF1_RDINDEX)]	@; buffer has not wrapped around so update rdindex with incremented value
	mov r0,r2					@;get return value= next value from ringbuffer
	CPSIE i						@;end of critical region
	bx lr						@;  and back
	
	
	.global ringbufbuf_wr		@;called from the RX interrupt or Msg_Handler
	.thumb_func
ringbufbuf_wr:	@; ringbufbuf_wr(uint8_t *bufHANDLE, uint8_t wrdata); //
//	push {r7,lr}				@;need for speed
	CPSID i						@;possible critical region, depending on how called

	ldr r2,[r0,#(BUF_WRINDEX)]	@;get wrindex in r2. 
	strb r1,[r0,r2]				@; and store new character there (potentially overwrites unread data)
	@;increment wrindex and check for wraparound
	adds r2,#1					@; update wrindex
	ldr r3,[r0,#(BUF_MAXINDEX)]	@; maxindex in r3
	subs r3,r3,r2				@; r3=maxindex-wrindex	
	ite	eq						@; conditionally wrap index
	streq r3,[r0,#(BUF_WRINDEX)]	@; wrindex has reached wrap around, so restart it
	strne r2,[r0,#(BUF_WRINDEX)]	@; buffer has not wrapped around so update wrindex with incremented value
	
	@;check if wrindex caught up with BUF0 rdindex and has overwritten oldest value
	ldr r2,[r0,#(BUF_WRINDEX)]		@;get wrindex in r2. 
	ldr r1,[r0,#(BUF0_RDINDEX)]	@;get rdindex in r1.
	cmp r2,r1					@;did wrindex catch up with rdindex?
	ittt ne						@; if not ... 
	ldrne r1,[r0,BUF_COUNT]		@;	  increment count of remaining data in primary buffer
	addne r1,#1					@; 		..
	strne r1,[r0,BUF_COUNT]		@; 		..
	bne 1f						@;  done with BUF0 check
	@; here if wrindex has caught up with rdindex and overwrites old data
	adds r1,#1					@;increment rdindex to stay ahead of wrindex
	ldr r3,[r0,#(BUF_MAXINDEX)]	@; maxindex in r3
	subs r3,r3,r1				@; r3=maxindex-rdindex
	ite	eq						@; conditionally wrap index
	streq r3,[r0,#(BUF0_RDINDEX)]	@; rdindex has reached wrap around, so reinitialize rdindex
	strne r1,[r0,#(BUF0_RDINDEX)]	@; buffer has not wrapped around so update rdindex with incremented value
	//here when old data was overwritten
	ldrh r1,[r0,#(BUF0_NUMOVERRUNS)]	@; update overruns count
	adds r1,#1							@; ..
	strh r1,[r0,#(BUF0_NUMOVERRUNS)]	@; ..

1:	@;check if wrindex caught up with BUF1 rdindex and has overwritten oldest value
@;	ldr r2,[r0,#(BUF_WRINDEX)]		@;get wrindex in r2.  -- unnecessary - r2 still has write index
	ldr r1,[r0,#(BUF1_RDINDEX)]	@;get rdindex in r1.
	cmp r2,r1					@;did wrindex catch up with rdindex?
	bne 1f						@;  no -- done with BUF1 check
	@; here if wrindex has caught up with rdindex and overwrites old data
	adds r1,#1					@;increment rdindex to stay ahead of wrindex
	ldr r3,[r0,#(BUF_MAXINDEX)]		@; maxindex in r3
	subs r3,r3,r1				@; r3=maxindex-rdindex
	ite	eq						@; conditionally wrap index
	streq r3,[r0,#(BUF1_RDINDEX)]	@; rdindex has reached wrap around, so reinitialize rdindex
	strne r1,[r0,#(BUF1_RDINDEX)]	@; buffer has not wrapped around so update rdindex with incremented value
	//here when old data was overwritten
	ldrh r1,[r0,#(BUF1_NUMOVERRUNS)]	@; update overruns count
	adds r1,#1							@; ..
	strh r1,[r0,#(BUF1_NUMOVERRUNS)]	@; ..

1:	//here in all cases
	CPSIE i						@;end of critical region
	bx lr						@; and back


	.global ringbufbuf_init 		@;uint32_t ringbufbuf_init(uint8_t *bufHANDLE, uint32_t maxindex); //initialize bufHANDLE structure
	.thumb_func
ringbufbuf_init: 
	str r1,[r0,#(BUF_MAXINDEX)]		@; set maxindex
	ldr r1,[r0,#(BUF1_NUMOVERRUNS)]	@; get both overrun counts for possible diagnostic (to answer which buffer is not getting read)
	mov r2,#0						@; zero everything else
	strh r2,[r0,#(BUF0_NUMNEWLINES)]@; ..
	strh r2,[r0,#(BUF0_NUMOVERRUNS)]@; .. 	
	str r2,[r0,#(BUF0_RDINDEX)]		@; .. 
	strh r2,[r0,#(BUF1_NUMNEWLINES)]@; .. 
	strh r2,[r0,#(BUF1_NUMOVERRUNS)]@; .. 	
	str r2,[r0,#(BUF1_RDINDEX)]		@; ..
	str r2,[r0,#(BUF_WRINDEX)]			@; .. 
	mov r0,r1						@; returns prior overrun values in lo/hi halves of R0:  lo=BUF1_NUMOVERRUNS, hi=BUF0_NUMOVERRUNS
	bx lr							@;  and back
	
	.global ringbufbuf0_reset 		@;uint32_t ringbufbuf0_rest(uint8_t *bufHANDLE); //'removes' values in buffer0 
	.thumb_func
ringbufbuf0_reset: 
	ldr r1,[r0,#(BUF_WRINDEX)]		@;moving BUF0 read index up to the current write location effectively empties BUF0
	str r1,[r0,#(BUF0_RDINDEX)]		@; ..
	bx lr							@;  and back
	
	.global ringbufbuf1_reset 		@;uint32_t ringbufbuf0_rest(uint8_t *bufHANDLE); //'removes' values in buffer0 
	.thumb_func
ringbufbuf1_reset: 
	ldr r1,[r0,#(BUF_WRINDEX)]		@;moving BUF1 read index up to the current write location effectively empties BUF0
	str r1,[r0,#(BUF1_RDINDEX)]		@; ..
	bx lr							@;  and back
	


	




