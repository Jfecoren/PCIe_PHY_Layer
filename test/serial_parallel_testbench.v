`timescale 1ms/100ps

`include "cmos_cells.v"
`include "serial_paralelo.v"
`include "serial_parallel_synth.v"
`include "serial_parallel_tester.v"

module serial_parallel_testbench;
    wire [7:0] data_out, data_out_synth;
    wire clk_32f, clk_4f, valid_out, valid_out_synth, data_in;

    serial_paralelo s_p (/*AUTOINST*/
						// Outputs
						.valid_out		(valid_out),
						.data_out		(data_out),
						// Inputs
						.data_in		(data_in),
						.clk_4f			(clk_4f),
						.clk_32f		(clk_32f));

    serial_parallel_tester spt(/*AUTOINST*/
								// Outputs
								.data_in			(data_in),
								.clk_4f				(clk_4f),
								.clk_32f			(clk_32f),
								// Inputs
								.valid_out			(valid_out),
								.data_out			(data_out),
								.valid_out_synth	(valid_out_synth),
								.data_out_synth		(data_out_synth));

	serial_paralelo_synth sps (/*AUTOINST*/
						// Outputs
						.valid_out			(valid_out_synth),
						.data_out			(data_out_synth),
						// Inputs
						.data_in			(data_in),
						.clk_4f				(clk_4f),
						.clk_32f			(clk_32f));
    
endmodule 
