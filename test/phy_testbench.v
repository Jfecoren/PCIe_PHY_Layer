
`timescale 1s/1ns

`include "phy.v"
`include "phy_tester.v"

module PHY_TESTBENCH;
	wire [31:0] data_out, data_in;
	wire valid_out, valid_in;
	wire clk_32f, clk_2f, reset;
	
	
	clk_gen elrelojito(.clk_2f		(clk_2f),
						.clk_32f	(clk_32f),
						.reset		(reset)
						);
	
	PHY elmodulito(/*AUTOINST*/
					.data_out		(data_out),
					.data_in		(data_in),
					.valid_out		(valid_out),
					.valid_in		(valid_in),
					.clk_32f		(clk_32f),
					.reset			(reset)
					);
	
	PHY_TESTER eltestesito(/*AUTOINST*/
					.data_out		(data_out),
					.data_in		(data_in),
					.valid_out		(valid_out),
					.valid_in		(valid_in),
					.clk_32f		(clk_32f),
					.clk_2f			(clk_2f),
					.reset			(reset)
					);

endmodule
