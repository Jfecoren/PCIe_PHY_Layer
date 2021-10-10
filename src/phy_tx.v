// PHY Layer; Transmision Module

`include "clk_gen.v"
`include "byte_striping.v"
`include "m32_8.v"


module phy_tx(data_out_0, data_out_1, valid_out_0, valid_out_1, , data_in, valid_in, reset, clk_32f);
	output reg [7:0] data_out_0, data_out_1;
	output reg valid_out_0, valid_out_1;
	input [31:0] data_in;
	input valid_in, reset, clk_32f;
	
	wire clk_f, clk_2f, clk_4f;
	wire lane_0, lane_1, valid_0, valid_1;
	wire valid_32_0, valid_32_1;
	// Clock generator module
	clk_gen clock_gen(clk_f, clk_2f, clk_4f, reset, clk_32f);
	// Byte Striping module
	BYTE_STRIPING bte_strp(lane_0, lane_1, valid_0, valid_1, data_in, valid_in, clk_2f, clk_f);
	//32b to 8b demuxes
	m32b_8 conv_0(data_out_0, valid_out_0, lane_0, valid_0, reset, clk_4f);
	m32b_8 conv_1(data_out_1, valid_out_1, lane_1, valid_1, reset, clk_4f);

endmodule
