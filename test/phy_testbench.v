
`timescale 1s/1ns
`include "cmos_cells.v"
`include "phy.v"
//`include "phy_synth.v"
`include "phy_tester.v"

module PHY_TESTBENCH;
	wire [31:0] data_out, data_in;
	wire valid_out, valid_in;
	wire clk_32f;
	wire sincronizar_bus;
	
	PHY phy_module(/*AUTOINST*/
					.data_out			(data_out),
					.data_in			(data_in),
					.valid_out			(valid_out),
					.valid_in			(valid_in),
					.clk_32f			(clk_32f),
					.reset				(reset),
					.reset_clk			(reset_clk),
					.sincronizar_bus	(sincronizar_bus)
					);
	
	PHY_TESTER mtester(/*AUTOINST*/
					.data_out			(data_out),
					.data_in			(data_in),
					.valid_out			(valid_out),
					.valid_in			(valid_in),
					.clk_32f			(clk_32f),
					.reset				(reset),
					.reset_clk			(reset_clk),
					.sincronizar_bus	(sincronizar_bus)
					);

endmodule
