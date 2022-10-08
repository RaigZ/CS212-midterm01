@roll_die.s
@roll a random number from 1 to 6 and return it
.cpu	cortex-a53
.fpu	neon-fp-armv8
.data
val:	.asciz 	"%d\n"
.text
.align 2
.global roll_die
.type roll_die, %function

roll_die:
	push	{fp, lr}
	add 	fp, sp, #4 	@point fp to first memory location

	bl 	rand
	mov 	r1, #6
	udiv	r2, r0, r1
	mul	r2, r2, r1
	sub	r2, r0, r2
		
	add	r0, r2, #1
	
	sub	sp, fp, #4 	@set stack pointer back to first memory location
	pop	{fp, pc}

