`timescale 1ms/100ps
`include "paralelo_serial.v"
`include "probador_paralelo_serial.v"

module banco_paralelo_serial;
    wire clk_4f, clk_32f, valid_in, data_out;
    wire [7:0] data_in;
    
    paralelo_serial ps(/*AUTOINST*/
		       // Outputs
		       .data_out	(data_out),
		       // Inputs
		       .clk_4f		(clk_4f),
		       .clk_32f		(clk_32f),
		       .data_in		(data_in[7:0]),
		       .valid_in	(valid_in));

    probador_paralelo_serial pps(/*AUTOINST*/
				 // Outputs
				 .clk_32f		(clk_32f),
				 .clk_4f		(clk_4f),
				 .data_in		(data_in[7:0]),
				 .valid_in		(valid_in),
				 // Inputs
				 .data_out		(data_out));
endmodule 