@main.s
.cpu	cortex-a53
.fpu	neon-fp-armv8
.data
first: .asciz 	"1st: %d\n"
second:	.asciz	"2nd: %d\n"
inp:	.asciz 	"%d\n"
sum:	.asciz	"Sum: %d\n"
indx:	.asciz	"Index of Sum (each run): %d\n"
.text
.align 2
.global	main
.type	main, %function

main:
	push	{fp, lr}
	add 	fp, sp, #4
	mov 	r4, #10
	mov 	r0, #0
alloc:	
	cmp	r4, #0
	blt 	END_ALLOC
	push	{r0}		@Allocate 0s into stack
	sub	r4, r4, #1
	b	alloc
END_ALLOC:	
	mov	r0, #0
	bl	time
	bl	srand
edgecase1:	
	bl	get_rolls	@return number of rolls in r0
	cmp	r0, #1
	blt	edgecase1	@r0 < 1, then call get_rolls, no signed int	
	mov	r10, r0		@num_rolls = returned value of get_rolls
	
	mov	r9, #1
loop1:	
	cmp	r9, r10
	bgt 	end	
@roll_die
	bl	roll_die
	mov	r8, r0
@1st
	mov	r1, r0
	ldr 	r0, =first
	bl	printf	

	bl	roll_die	@call roll_die twice, add the two numbers
	mov	r7, r0
	add	r6, r7, r8	@sum

@2nd
	mov	r1, r0
	ldr	r0, =second
	bl	printf
	
@SUM	
	mov	r1, r6
	ldr	r0, =sum
	bl	printf

@determine location of stack that corresponds with sum
	sub	r4, r6, #2 @index of sum
	@mov	r5, #4
	@mul	r5, r5, r4
	mov 	r5, #0
	@sub	r4, r6, #12
check: 
	cmp	r5, r4
	add	r5, r5, #1
	add	sp, sp, #4
	beq	exit
	b	check
exit:	
@index that moves with sp		
	mov	r1, r4
	ldr	r0, =indx
	bl	printf
	
	mov	r0, sp
	
	@bl	update_count
	mov	r5, #0
fix: 	
	cmp	r5, r4
	add	r5, r5, #1
	sub	sp, sp, #4
	beq	exit2
	b	fix
exit2:	
	add 	r9, r9, #1	@INC loop
	b	loop1		@repeat loop	
	@bl	print_table
end:	
	sub	sp, fp, #4
	pop	{fp, pc}	
