`timescale 1ns / 1ns
// Testbench modules for Byte Striping & Un-striping
`include "cmos_cells.v"
`include "byte_sus_tester.v"
`include "byte_striping.v"
`include "byte_unstriping.v"

// Synthetized structural modules
`include "striping_synth.v"
`include "unstriping_synth.v"

module TESTBENCH_STRIPING;
	wire [31:0] lane_0, lane_1;
	wire [31:0] lane_0_s, lane_1_s;
	wire valid_0, valid_1;
	wire valid_0_s, valid_1_s;
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

STRIPING_SYNTH mstriping_s(.lane_0			(lane_0_s),
							.lane_1			(lane_1_s),
							.valid_0		(valid_0_s),
							.valid_1		(valid_1_s),
							.data_in		(data_in),
							.valid_in		(valid_in),
							.clk_2f			(clk_2f),
							.clk_f			(clk_f)
							);

TESTER_STRIPING mtester(.lane_0			(lane_0),
						.lane_1			(lane_1),
						.lane_0_s		(lane_0_s),
						.lane_1_s		(lane_1_s),
						.valid_0		(valid_0),
						.valid_1		(valid_1),
						.valid_0_s		(valid_0_s),
						.valid_1_s		(valid_1_s),
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
	wire [31:0] data_out_s;
	wire valid_out, clk_f, clk_2f;
	wire valid_out_s;


BYTE_UNSTRIPING munstriping(.lane_0			(lane_0),
							.lane_1			(lane_1),
							.valid_0		(valid_0),
							.valid_1		(valid_1),
							.data_out		(data_out),
							.valid_out		(valid_out),
							.clk_2f			(clk_2f),
							.clk_f			(clk_f)
							);
UNSTRIPING_SYNTH munstriping_s(.lane_0		(lane_0),
							.lane_1			(lane_1),
							.valid_0		(valid_0),
							.valid_1		(valid_1),
							.data_out		(data_out_s),
							.valid_out		(valid_out_s),
							.clk_2f			(clk_2f),
							.clk_f			(clk_f)
							);

TESTER_UNSTRIPING mtester(.lane_0			(lane_0),
							.lane_1			(lane_1),
							.valid_0		(valid_0),
							.valid_1		(valid_1),
							.data_out		(data_out),
							.data_out_s		(data_out_s),
							.valid_out		(valid_out),
							.valid_out_s	(valid_out_s),
							.clk_2f			(clk_2f),
							.clk_f			(clk_f)
							);

endmodule
