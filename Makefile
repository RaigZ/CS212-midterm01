midterm: main.o get_rolls.o print_table.o roll_die.o update_count.o
	gcc -o midterm main.o get_rolls.o print_table.o roll_die.o update_count.o
main.o:	main.s
	gcc -c -g main.s
get_rolls.o: get_rolls.s
	gcc -c -g get_rolls.s
print_table.o: print_table.s
	gcc -c -g print_table.s
roll_die.o: roll_die.s
	gcc -c -g roll_die.s
update_count.o:
	gcc -c -g update_count.s
clean: 
	rm *.o
