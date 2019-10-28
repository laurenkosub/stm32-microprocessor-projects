

	@;useful macro
	.macro MOV_imm32 reg, constant
		movw \reg, #:lower16:\constant
		movt \reg, #:upper16:\constant
	.endm

	.syntax unified				@; ARM Unified Assembler Language (UAL) is allowed 
	.thumb						@; here we're use thumb instructions only

	.bss						@;start of RAM data -- all zeroed by startup (!!important that all be zero at start)
	.align 2					@;data is word so should be on word-boundary; 
	.comm myrawfloat,4			@;
	
	.align 2
	.text
	.global savefloatraw		@; uint32_t savefloat(void* rawfloat, float f);
savefloatraw:
	str r1,[r0]
	mov r0,r1
	bx lr