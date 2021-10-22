// PHY Layer; Reception Module

`include "clk_gen.v"
`include "byte_unstriping.v"
`include "m8_32.v"

module PHY_RX(data_in_0, data_in_1, valid_in_0, valid_in_1, data_out, valid_out, reset, clk_2f);
	output [31:0] data_out;
	output valid_out;
	input [7:0] data_in_0, data_in_1;
	input valid_in_0, valid_in_1, reset, clk_2f;

	// wires
	wire clk_f, clk_32f, clk_4f;
	wire [31:0] lane_0, lane_1;
	wire valid_0, valid_1, valid_32_0, valid_32_1;

	// Clock generator module
	clk_gen clock_gen(clk_f, clk_2f, clk_4f, clk_32f, reset);

	BYTE_UNSTRIPING bte_unstrp(lane_0, lane_1, valid_0, valid_1, data_out, valid_out, clk_2f, clk_f);
	//8b to 32b demuxes
	m8b_32 conv_0(data_in_0, valid_in_0, lane_0, valid_0, reset, clk_4f);
	m8b_32 conv_1(data_in_1, valid_in_1, lane_1, valid_1, reset, clk_4f);

endmodule
