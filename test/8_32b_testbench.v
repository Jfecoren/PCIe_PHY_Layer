`timescale 1ms/100ps

`include "cmos_cells.v"
`include "m8_32.v"
`include "m8_32_synth.v"
`include "8_32b_tester.v"

// TestBench
module m8_32b_testbench;
wire [31:0] data_8_32, data_8_32_sint;
wire [7:0] data_input;
wire clk_f, clk_4f, clk_32f, valid_input, valid_8_32, valid_8_32_sint;
wire sinc, sincout, sincout_s;

m8_32 mod8_32(/*AUTOINST*/
                 .clk_32f 			(clk_32f),
                 .clk_4f 			(clk_4f),
                 .clk_f 			(clk_f),
				 .data_input  		(data_input), 
				 .valid_input 		(valid_input),
				 .reset 			(reset),
				 .data_8_32  		(data_8_32),
				 .valid_8_32 		(valid_8_32),
				 .sinc				(sinc),
				 .sincout			(sincout)
);

m8_32_tester t_8_32(/*AUTOINST*/
                 .clk_32f 			(clk_32f),
                 .clk_4f 			(clk_4f),
                 .clk_f 			(clk_f),
				 .data_input  		(data_input), 
				 .valid_input 		(valid_input),
				 .reset 			(reset),
				 .data_8_32  		(data_8_32),
                 .data_8_32_sint 	(data_8_32_sint),
				 .valid_8_32 		(valid_8_32),
                 .valid_8_32_sint 	(valid_8_32_sint),
				 .sinc				(sinc),
				 .sincout			(sincout_s)

);

m8_32_synth ts_8_32(/*AUTOINST*/
                 .clk_32f 			(clk_32f),
                 .clk_4f 			(clk_4f),
                 .clk_f 			(clk_f),
				 .data_input  		(data_input), 
				 .valid_input 		(valid_input),
                 .data_8_32		 	(data_8_32_sint),
                 .valid_8_32 		(valid_8_32_sint),
				 .sinc				(sinc),
				 .sincout			(sincout_s),
				 .reset 			(reset)


);

endmodule