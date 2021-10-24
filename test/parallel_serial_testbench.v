`timescale 1ms/100ps

`include "cmos_cells.v"
`include "paralelo_serial.v"
`include "parallel_serial_synth.v"
`include "parallel_serial_tester.v"

module parallel_serial_testbench;
    wire clk_4f, clk_32f, valid_in, data_out, data_out_synth, reset;
    wire [7:0] data_in;
    
    paralelo_serial ps(/*AUTOINST*/
		       // Outputs
		       .data_out	(data_out),
		       // Inputs
		       .clk_4f		(clk_4f),
		       .clk_32f		(clk_32f),
		       .data_in		(data_in),
			   .reset		(reset),
		       .valid_in	(valid_in));

    parallel_serial_tester pps(/*AUTOINST*/
				 // Outputs
				.clk_32f			(clk_32f),
				.clk_4f				(clk_4f),
				.data_in			(data_in),
				.valid_in			(valid_in),
			    .reset				(reset),
				// Inputs
				.data_out			(data_out),
		       	.data_out_synth		(data_out_synth));

	paralelo_serial_synth pss(/*AUTOINST*/
		       // Outputs
		       .data_out	(data_out_synth),
		       // Inputs
		       .clk_4f		(clk_4f),
		       .clk_32f		(clk_32f),
		       .data_in		(data_in),
		       .valid_in	(valid_in),
			   .reset		(reset)
			   );
endmodule 