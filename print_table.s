@print_table.s
.cpu	cortex-a53
.fpu	neon-fp-armv8
.data
prompt: .asciz "Sum of dice\t Number of Occurrences\n"
.text
.align 2
.global print_table
.type	print_table, %function

print_table:
	push	{fp, lr}
	add	fp, sp, #4
	
	mov	r4, #0
	mov	r5, #11
loop:
	cmp	r4, r5
	bge	end
	ldr	r0, =prompt
	bl	printf

	add	r4, r4, #1
	b	loop
end:
	sub	sp, fp, #4
	pop	{fp, pc}


