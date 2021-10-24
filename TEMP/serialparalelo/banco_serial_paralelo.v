`timescale 1ms/100ps
`include "serial_paralelo.v"
`include "probador_serial_paralelo.v"

module banco_serial_paralelo;
    wire [7:0] data_out;
    wire clk_32f, clk_4f, valid_out, data_in; 

    serial_paralelo s_p (/*AUTOINST*/
			 // Outputs
			 .valid_out		(valid_out),
			 .data_out		(data_out[7:0]),
			 // Inputs
			 .data_in		(data_in),
			 .clk_4f		(clk_4f),
			 .clk_32f		(clk_32f));

    probador_serial_paralelo p_s_p(/*AUTOINST*/
				   // Outputs
				   .data_in		(data_in),
				   .clk_4f		(clk_4f),
				   .clk_32f		(clk_32f),
				   // Inputs
				   .valid_out		(valid_out),
				   .data_out		(data_out[7:0]));
    
endmodule 
