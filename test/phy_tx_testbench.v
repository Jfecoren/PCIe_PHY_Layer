`timescale 1ns / 1ns
`include "cmos_cells.v"

`include "clk_gen.v"
`include "phy_tx.v"
//`include "phy_tx_synth.v"
`include "phy_tx_tester.v"

module TX_TESTBENCH;
	wire data_out_0, data_out_1;
	wire [31:0] data_in;
	wire valid_in, reset, reset_clk;
  	wire clk_32f, clk_4f, clk_2f, clk_f;

	clk_gen clk_gen(/*AUTOINST*/
					.clk_32f			(clk_32f),
					.clk_2f				(clk_2f),
					.clk_4f				(clk_4f),
					.clk_f				(clk_f),
					.reset_clk			(reset_clk));

  	PHY_TX tx0(/*AUTOINST*/
	  					.data_out_0     (data_out_0),
						.data_out_1     (data_out_1),
						.data_in        (data_in),
						.valid_in       (valid_in),
						.reset          (reset),
						.clk_32f        (clk_32f),
						.clk_2f			(clk_2f),
						.clk_4f			(clk_4f),
						.clk_f			(clk_f)
						);

	TX_TESTER mtester(/*AUTOINST*/
						.data_out_0     (data_out_0),
						.data_out_1     (data_out_1),
						.data_in        (data_in),
						.valid_in       (valid_in),
						.reset          (reset),
						.clk_32f        (clk_32f),
						.reset_clk		(reset_clk)
						);

endmodule
