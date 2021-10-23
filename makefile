SRC_DIR := src
BIN_DIR := bin
TST_DIR := test
LIB_DIR := lib
INC_DIR := include
VFLAGS := -I $(TST_DIR) -I $(LIB_DIR) -I $(INC_DIR) -I $(SRC_DIR)
CC=iverilog

all:
	@echo "type make then tab tab to see targets..."


bytesus: dirs synth
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

synth:
	yosys -s $(LIB_DIR)/synthesis.ys
	sed -i 's/BYTE_STRIPING/STRIPING_SYNTH/g' $(LIB_DIR)/striping_synth.v
	sed -i 's/BYTE_UNSTRIPING/UNSTRIPING_SYNTH/g' $(LIB_DIR)/unstriping_synth.v

dirs:
	mkdir -p $(BIN_DIR)
clean:
	rm -rf *.o *.vcd
	rm -rf $(BIN_DIR)/*.o $(BIN_DIR)/*.vcd
