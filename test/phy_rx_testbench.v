`timescale 1ns / 1ns

`include "phy_rx.v"
`include "phy_rx_tester.v"

module RX_TESTBENCH;
    wire [7:0] data_in_0, data_in_1;
	wire valid_in_0, valid_in_1;
	wire [31:0] data_out;
	wire valid_out, reset;
    wire clk_32f, clk_4f, clk_2f, clk_f;

	clk_gen clk_gen(/*AUTOINST*/
    
    );

    PHY_RX rx0(/*AUTOINST*/
    );

    RX_TESTER mtester(/*AUTOINST*/
    );

endmodule
