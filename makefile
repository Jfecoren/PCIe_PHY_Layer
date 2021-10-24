SRC_DIR := src
BIN_DIR := bin
TST_DIR := test
LIB_DIR := lib
INC_DIR := include
SYN_DIR := synth
VFLAGS := -I $(TST_DIR) -I $(LIB_DIR) -I $(INC_DIR) -I $(SRC_DIR) -I $(SYN_DIR)
CC=iverilog

all:
	@echo "type make then tab tab to see targets..."


bytesus: dirs
	$(CC) -o $(BIN_DIR)/byte_sus.o $(TST_DIR)/byte_sus_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/byte_sus.o
	gtkwave byte_sus.vcd
phytx: dirs
	$(CC) -o $(BIN_DIR)/phy_tx.o $(TST_DIR)/phy_tx_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/phy_tx.o
	gtkwave phy_tx.vcd
phyrx: dirs
	$(CC) -o $(BIN_DIR)/phy_rx.o $(TST_DIR)/phy_rx_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/phy_rx.o
	gtkwave phy_rx.vcd

phy: dirs
	$(CC) -o $(BIN_DIR)/phy.o $(TST_DIR)/phy_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/phy.o
	gtkwave phy.vcd

phys:
	yosys -s $(SYN_DIR)/synth_phy.ys

m32_8s: dirs
	$(CC) -o $(BIN_DIR)/m32_8.o $(TST_DIR)/32_8b_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/m32_8.o
	gtkwave m32_8.vcd
m8_32s: dirs
	$(CC) -o $(BIN_DIR)/m8_32.o $(TST_DIR)/8_32b_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/m8_32.o
	gtkwave m8_32.vcd
bus_ps:
	$(CC) -o $(BIN_DIR)/parallel_serial.o $(TST_DIR)/parallel_serial_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/parallel_serial.o
	gtkwave parallel_serial.vcd


synth_byte:
	yosys -s $(SYN_DIR)/synth_modules_byte.ys
	sed -i 's/BYTE_STRIPING/STRIPING_SYNTH/g' $(SYN_DIR)/striping_synth.v
	sed -i 's/BYTE_UNSTRIPING/UNSTRIPING_SYNTH/g' $(SYN_DIR)/unstriping_synth.v
synth_conv:	
	yosys -s $(SYN_DIR)/synth_modules_conv.ys
	sed -i 's/m32_8(/m32_8_synth(/g' $(SYN_DIR)/m32_8_synth.v
	sed -i 's/m8_32(/m8_32_synth(/g' $(SYN_DIR)/m8_32_synth.v
synth_bus:
	yosys -s $(SYN_DIR)/synth_modules_bus.ys
	sed -i 's/paralelo_serial(/paralelo_serial_synth(/g' $(SYN_DIR)/parallel_serial_synth.v
	#sed -i 's/m8_32(/m8_32_synth(/g' $(SYN_DIR)/m8_32_synth.v


dirs:
	mkdir -p $(BIN_DIR)
clean:
	rm -rf *.o *.vcd
	rm -rf $(BIN_DIR)/*.o $(BIN_DIR)/*.vcd
