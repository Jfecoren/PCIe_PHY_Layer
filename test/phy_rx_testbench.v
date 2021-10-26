`timescale 1s / 1s
`include "cmos_cells.v"

`include "clk_gen.v"
`include "phy_rx.v"
//`include "phy_rx_synth.v"
`include "phy_rx_tester.v"

module RX_TESTBENCH;
    wire data_in_0, data_in_1;
	wire [31:0] data_out;
	wire valid_out, reset, sincout;
    wire clk_32f, clk_4f, clk_2f, clk_f;

	clk_gen clk_gen(/*AUTOINST*/
					// Inputs
					.clk_32f		(clk_32f),
					// Outputs
					.clk_2f			(clk_2f),
					.clk_4f			(clk_4f),
					.clk_f			(clk_f),
					.reset_clk		(reset_clk));

    PHY_RX rx0(/*AUTOINST*/
				.data_out       	(data_out),
				.valid_out      	(valid_out),
                .data_in_0      	(data_in_0),
				.data_in_1      	(data_in_1),
				.reset          	(reset),
				.clk_32f        	(clk_32f),
				.clk_2f				(clk_2f),
				.clk_4f				(clk_4f),
				.clk_f				(clk_f),
				.sincronizar_bus	(sincout)
				);

    RX_TESTER mtester(/*AUTOINST*/  
					.data_out       	(data_out),
				    .valid_out      	(valid_out),
                    .data_in_0      	(data_in_0),
				    .data_in_1      	(data_in_1),
				    .reset          	(reset),
					.reset_clk			(reset_clk),
				    .clk_32f        	(clk_32f),
					.sincout			(sincout)
				     );

endmodule
