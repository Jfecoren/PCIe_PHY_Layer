SRC_DIR := src
BIN_DIR := .
TST_DIR := test
INC_DIR := include
VFLAGS := -I $(TST_DIR) -I $(INC_DIR)

CC=iverilog

all: tests

tests:
	$(CC) -o $(BIN_DIR)/byte_sus.o $(TST_DIR)/byte_sus_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/byte_sus.o
	gtkwave $(BIN_DIR)/byte_sus.vcd

clean:
	rm -rf *.o *.vcd
