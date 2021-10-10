`timescale 1ms/100ps

`include "32_8b.v"
`include "32_8b_tester.v"
`include "cmos_cells.v"

module 32_8b_testbench; 
                wire clk_4f; 
				wire [31:0] data_strp; 
				wire valid_strp; 
				wire reset; 
				wire [7:0] data_32_8; 
				wire valid_32_8; 

m32b_8 mod32a8 (/*AUTOINST*/
                 .clk_4f (clk_4f),
				 .data_strp  (data_strp [31:0]), 
				 .valid_strp (valid_strp),
				 .reset (reset),
				 .data_32_8  (data_32_8 [31:0]),
				 .valid_32_8 (valid_32_8)

);

m32_8_tester mod32a8_t (/*AUTOINST*/
                 .clk_4f (clk_4f),
				 .data_strp  (data_strp [31:0]), 
				 .valid_strp (valid_strp),
				 .reset (reset),
				 .data_32_8  (data_32_8 [31:0]),
				 .valid_32_8 (valid_32_8),
                 .data_32_8_sint  (data_32_8_sint [31:0]),
				 .valid_32_8_sint (valid_32_8_sint)

);

m32_8_sint mod32a8_s (/*AUTOINST*/
                 .clk_4f (clk_4f),
				 .data_strp  (data_strp [31:0]), 
				 .valid_strp (valid_strp),
				 .reset (reset),
                 .data_32_8_sint  (data_32_8_sint [31:0]),
				 .valid_32_8_sint (valid_32_8_sint)

);
