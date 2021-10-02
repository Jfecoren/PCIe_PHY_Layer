CC=iverilog
byte_sus:
	$(CC) -o byte_sus.o byte_sus_testbench.v
	vvp byte_sus.o
	gtkwave byte_sus.vcd
