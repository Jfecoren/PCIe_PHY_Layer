all:
	yosys -s synth_modules_bus.ys
	sed -i 's/paralelo_serial(/paralelo_serial_synth(/g' paraleloserial/parallel_serial_synth.v
	iverilog -o paralelo_serial.o paraleloserial/banco_paralelo_serial.v -I paraleloserial
	vvp paralelo_serial.o
	gtkwave paralelo_serial.vcd