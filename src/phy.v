
`include "clk_gen.v"
`include "phy_rx.v"
`include "phy_tx.v"

module PHY(data_out, valid_out, data_in, valid_in, reset, clk_32f, sincronizar_bus);
	output [31:0] data_out;
	output valid_out;
	input [31:0] data_in;
	input valid_in, reset, clk_32f, sincronizar_bus;
	
	wire bus_serial_0, bus_serial_1;
	

	PHY_TX transmisor(bus_serial_0, bus_serial_1, data_in, valid_in, reset, clk_32f);

	PHY_RX receptor(data_out, valid_out, bus_serial_0, bus_serial_1, reset, clk_32f, sincronizar_bus);

endmodule
