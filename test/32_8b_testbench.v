`timescale 1ms/100ps

`include "cmos_cells.v"
`include "m32_8.v"
`include "m32_8_synth.v"
`include "32_8b_tester.v"


module m32_8b_testbench;

	wire clk_4f;
	wire [31:0] data_strp;
	wire valid_strp, valid_32_8_sint;
	wire reset;
	wire [7:0] data_32_8, data_32_8_sint;
	wire valid_32_8;

	m32_8 mod32a8(/*AUTOINST*/
					.clk_4f 		(clk_4f),
					.data_strp  	(data_strp), 
					.valid_strp 	(valid_strp),
					.reset 			(reset),
					.data_32_8  	(data_32_8),
					.valid_32_8 	(valid_32_8)
	);

	m32_8_tester mod32a8_t(/*AUTOINST*/
					.clk_4f 			(clk_4f),
					.data_strp  		(data_strp), 
					.valid_strp 		(valid_strp),
					.reset 				(reset),
					.data_32_8  		(data_32_8),
					.valid_32_8 		(valid_32_8),
					.data_32_8_sint  	(data_32_8_sint),
					.valid_32_8_sint 	(valid_32_8_sint)
	);

	m32_8_synth mod32a8_s(/*AUTOINST*/
					.clk_4f 				(clk_4f),
					.data_strp  			(data_strp), 
					.valid_strp 			(valid_strp),
					.reset 					(reset),
					.data_32_8  			(data_32_8_sint),
					.valid_32_8 			(valid_32_8_sint)
	);


endmodule