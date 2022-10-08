@update_count.s
.cpu 	cortex-a53
.fpu	neon-fp-armv8
.data
.text
.align 2
.global	update_count
.type	update_count, %function

update_count:
	push	{fp, lr}
	add	fp, sp, #4	
	
	ldr 	r0, [sp]	@store current value of sp into r8
	add	r0, r0, #1	@from load, increment whatever is in the sp
	str	r0, [sp]	@store it back into sp
			
	sub	sp, fp, #4
	pop	{fp, pc}	
