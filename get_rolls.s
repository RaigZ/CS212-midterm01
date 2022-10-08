@get_rolls.s
@Get the number of times to roll the dice
.cpu	cortex-a53
.fpu 	neon-fp-armv8
.data
prompt:	.asciz	">> input the number of times to roll the pair of dice: "
inp:	.asciz	"%d"
.text
.align 2
.global	get_rolls
.type	get_rolls, %function
get_rolls:
	push	{fp, lr} @save lr to fp on the stack 

	add	fp, sp, #4 @set fp to the initial segment of the stack
	ldr	r0, =prompt
	bl 	printf
	
	sub 	sp, sp, #4	
	ldr	r0, =inp
	mov	r1, sp
	bl 	scanf
	
	ldr	r0, [sp]	@dereference stack pointer and move the value to r0
	sub	sp, fp, #4	@reset stack pointer
	pop	{fp, pc}	@repopulate fp and send program counter to the value of lr
	
