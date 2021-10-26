SRC_DIR := src
BIN_DIR := bin
TST_DIR := test
LIB_DIR := lib
INC_DIR := include
SYN_DIR := synth
VFLAGS := -I $(TST_DIR) -I $(LIB_DIR) -I $(INC_DIR) -I $(SRC_DIR) -I $(SYN_DIR)
CC=iverilog

all: phy
	@echo "type make then tab tab to see targets..."

# PHY / PHY_TX / PHY_RX Modules
phy: dirs #synt_phy
	$(CC) -o $(BIN_DIR)/phy.o $(TST_DIR)/phy_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/phy.o
	gtkwave phy.vcd
phytx: dirs #synt_phyx
	$(CC) -o $(BIN_DIR)/phy_tx.o $(TST_DIR)/phy_tx_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/phy_tx.o
	gtkwave phy_tx.vcd
phyrx: dirs #synt_phyx
	$(CC) -o $(BIN_DIR)/phy_rx.o $(TST_DIR)/phy_rx_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/phy_rx.o
	gtkwave phy_rx.vcd
# Open de final gtkwave signals file to be visualized
reload: 
	$(CC) -o $(BIN_DIR)/phy.o $(TST_DIR)/phy_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/phy.o
	gtkwave $(BIN_DIR)/phy.gtkw

# Submodules
# Byte Striping & Unstriping
bytesus: dirs synt_byte
	$(CC) -o $(BIN_DIR)/byte_sus.o $(TST_DIR)/byte_sus_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/byte_sus.o
	gtkwave byte_sus.vcd
# Mux 32-8
m32_8s: dirs synt_dem
	$(CC) -o $(BIN_DIR)/m32_8.o $(TST_DIR)/32_8b_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/m32_8.o
	gtkwave m32_8.vcd
# Demux 8-32
m8_32s: dirs synt_dem
	$(CC) -o $(BIN_DIR)/m8_32.o $(TST_DIR)/8_32b_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/m8_32.o
	gtkwave m8_32.vcd
# Bus Parallel to Serial
bus_ps: synt_bus
	$(CC) -o $(BIN_DIR)/parallel_serial.o $(TST_DIR)/parallel_serial_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/parallel_serial.o
	gtkwave parallel_serial.vcd
# Bus Serial to Parallel
bus_sp: synt_bus
	$(CC) -o $(BIN_DIR)/serial_parallel.o $(TST_DIR)/serial_parallel_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/serial_parallel.o
	gtkwave serial_parallel.vcd

# Clock Generator Module
clock:
	yosys -s $(SYN_DIR)/synth_clk.ys
	$(CC) -o $(BIN_DIR)/clk_gen.o $(TST_DIR)/clk_testbench.v $(VFLAGS)
	vvp $(BIN_DIR)/clk_gen.o
	gtkwave clk_gen.vcd

# Yosys files: synthesis/estructural descriptions

# PHY Module
synt_phy:
	yosys -s $(SYN_DIR)/synth_phy.ys
# PHY_TX & PHY_RX Submodules
synt_phyx:
	yosys -s $(SYN_DIR)/synth_phyx.ys
# Byte Striping & Unstriping subsubmodules
synt_byte:
	yosys -s $(SYN_DIR)/synth_modules_byte.ys
	sed -i 's/BYTE_STRIPING/STRIPING_SYNTH/g' $(SYN_DIR)/striping_synth.v
	sed -i 's/BYTE_UNSTRIPING/UNSTRIPING_SYNTH/g' $(SYN_DIR)/unstriping_synth.v
# Mux & Demux subsubmodules
synt_dem:
	yosys -s $(SYN_DIR)/synth_modules_conv.ys
	sed -i 's/m32_8(/m32_8_synth(/g' $(SYN_DIR)/m32_8_synth.v
	sed -i 's/m8_32(/m8_32_synth(/g' $(SYN_DIR)/m8_32_synth.v
# Parallel & Serial subsubmodules
synt_bus:
	yosys -s $(SYN_DIR)/synth_modules_bus.ys
	sed -i 's/paralelo_serial(/paralelo_serial_synth(/g' $(SYN_DIR)/parallel_serial_synth.v
	sed -i 's/serial_paralelo(/serial_paralelo_synth(/g' $(SYN_DIR)/serial_parallel_synth.v

# If BIN folder does not exist, create it
dirs:
	mkdir -p $(BIN_DIR)
	mkdir -p $(SYN_DIR)
# Usual clean targets
clean:
	rm -rf *.o *.vcd
	rm -rf $(BIN_DIR)/*.o $(BIN_DIR)/*.vcd
