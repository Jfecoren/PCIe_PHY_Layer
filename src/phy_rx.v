// PHY Layer; Reception Module

`include "byte_unstriping.v"
`include "m8_32.v"
`include "serial_paralelo.v"

module PHY_RX(data_out, valid_out, data_in_0, data_in_1, reset, clk_32f);
	output [31:0] data_out;
	output valid_out;
	input data_in_0, data_in_1;
	input reset, clk_32f;

	// wires
	wire clk_f, clk_2f, clk_4f;
	wire [7:0] data_8b_0, data_8b_1;
	wire [31:0] data_32b_0, data_32b_1;
	//wire valid_in_0, valid_in_1;
	wire valid_0, valid_1, valid_8b_0, valid_8b_1;
	wire valid_32b_0, valid_32b_1;

	// Clock generator module
	clk_gen clock_gen(clk_f, clk_2f, clk_4f, clk_32f, reset);
	//Byte Unstriping Module
	BYTE_UNSTRIPING bte_unstrp(data_out, valid_out, data_32b_0, data_32b_1, valid_32b_0, valid_32b_1, clk_2f, clk_f);
	//8b to 32b demuxes
	m8_32 conv_0(data_32b_0, valid_32b_0, data_8b_0, valid_8b_0, reset, clk_f, clk_4f, clk_32f);
	m8_32 conv_1(data_32b_1, valid_32b_1, data_8b_1, valid_8b_1, reset, clk_f, clk_4f, clk_32f);

	// Parallel to Serial Module
	serial_paralelo serelo_0(data_in_0, clk_4f, clk_32f, valid_8b_0, data_8b_0);
	serial_paralelo serelo_1(data_in_1, clk_4f, clk_32f, valid_8b_1, data_8b_1);
	

endmodule
