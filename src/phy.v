
`include "clk_gen.v"
`include "phy_rx.v"
`include "phy_tx.v"

module PHY(data_out, valid_out, data_in, valid_in, reset, reset_clk, clk_32f, sincronizar_bus);
	output [31:0] data_out;
	output valid_out;
	input [31:0] data_in;
	input valid_in, reset, reset_clk, clk_32f, sincronizar_bus;
	
	wire bus_serial_0, bus_serial_1;
	// Clocks
	clk_gen generator(clk_f, clk_2f, clk_4f, clk_32f, reset_clk);
	
	PHY_TX transmisor(bus_serial_0, bus_serial_1, data_in, valid_in, reset, clk_32f, clk_4f, clk_2f, clk_f);
	
	PHY_RX receptor(data_out, valid_out, bus_serial_0, bus_serial_1, reset, clk_32f, clk_4f, clk_2f, clk_f, sincronizar_bus);

endmodule
