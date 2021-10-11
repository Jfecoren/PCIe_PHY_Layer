`timescale 1ns / 1ns

`include "phy_tx.v"
`include "phy_tx_tester.v"


module TX_TESTBENCH;
	wire [7:0] data_out_0, data_out_1;
	wire valid_out_0, valid_out_1;
	wire [31:0] data_in;
	wire valid_in, reset;
  wire clk_32f, clk_4f, clk_2f, clk_f;

	clk_gen clk_gen(/*AUTOINST*/
									.clk_2f			(clk_2f),
									.clk_32f		(clk_32f),
									.reset			(reset));

  PHY_TX tx0(/*AUTOINST*/
							.data_out_0      (data_out_0),
              .data_out_1     (data_out_1),
              .valid_out_0    (valid_out_0),
              .valid_out_1    (valid_out_1),
              .data_in        (data_in),
              .valid_in       (valid_in),
              .reset          (reset),
              .clk_32f        (clk_32f)
              );

TX_TESTER mtester(/*AUTOINST*/
						.data_out_0      (data_out_0),
            .data_out_1     (data_out_1),
            .valid_out_0    (valid_out_0),
            .valid_out_1    (valid_out_1),
            .data_in        (data_in),
            .valid_in       (valid_in),
            .reset          (reset),
            .clk_32f        (clk_32f),
            .clk_2f         (clk_2f)
            );

endmodule
