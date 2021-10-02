`timescale 1ns / 1ns

// Testbench modules for Byte Striping & Un-striping
`include "byte_sus_tester.v"
`include "../src/byte_sus.v"

module TESTBENCH_STRIPING;
	wire [31:0] lane_0, lane_1;
	wire valid_0, valid_1;
	wire [31:0] data_in;
	wire valid_in, clk_f, clk_2f;


BYTE_STRIPING mstriping(.lane_0			(lane_0),
						.lane_1			(lane_1),
						.valid_0		(valid_0),
						.valid_1		(valid_1),
						.data_in		(data_in),
						.valid_in		(valid_in),
						.clk_2f			(clk_2f),
						.clk_f			(clk_f)
						);

TESTER_STRIPING mtester(.lane_0			(lane_0),
						.lane_1			(lane_1),
						.valid_0		(valid_0),
						.valid_1		(valid_1),
						.data_in		(data_in),
						.valid_in		(valid_in),
						.clk_2f			(clk_2f),
						.clk_f			(clk_f)
						);

endmodule

module TESTBENCH_UNSTRIPING;
	wire [31:0] lane_0, lane_1;
	wire valid_0, valid_1;
	wire [31:0] data_out;
	wire valid_out, clk_f, clk_2f;


BYTE_UNSTRIPING munstriping(.lane_0			(lane_0),
							.lane_1			(lane_1),
							.valid_0		(valid_0),
							.valid_1		(valid_1),
							.data_out		(data_out),
							.valid_out		(valid_out),
							.clk_2f			(clk_2f),
							.clk_f			(clk_f)
							);

TESTER_UNSTRIPING mtester(.lane_0			(lane_0),
							.lane_1			(lane_1),
							.valid_0		(valid_0),
							.valid_1		(valid_1),
							.data_out		(data_out),
							.valid_out		(valid_out),
							.clk_2f			(clk_2f),
							.clk_f			(clk_f)
							);

endmodule
