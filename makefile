SRC_DIR := src
BIN_DIR := bin
TST_DIR := test
LIB_DIR := lib
INC_DIR := include
VFLAGS := -I $(TST_DIR) -I $(LIB_DIR) -I $(INC_DIR)

CC=iverilog

all: tests

tests: synth
	$(CC) -o $(BIN_DIR)/byte_sus.o $(TST_DIR)/byte_sus_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/byte_sus.o
	gtkwave byte_sus.vcd
synth:
	yosys -s $(LIB_DIR)/synthesis.ys
	sed -i 's/BYTE_STRIPING/STRIPING_SYNTH/g' $(LIB_DIR)/striping_synth.v
	sed -i 's/BYTE_UNSTRIPING/UNSTRIPING_SYNTH/g' $(LIB_DIR)/unstriping_synth.v
clean:
	rm -rf *.o *.vcd
	rm -rf $(BIN_DIR)/*.o $(BIN_DIR)/*.vcd
