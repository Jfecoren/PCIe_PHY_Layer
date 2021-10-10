`timescale 1ms/100ps

`include "m8_32.v"
`include "m8_32_tester.v"
`include "sin_m8_32.v"
`include "cmos_cells.v"

// TestBench
module m8_32_testbench;
wire [31:0] data_8_32; wire [31:0] data_8_32_sint  ; wire [7:0] data_input ;
wire clk_f, clk_4f, valid_input, valid_8_32, valid_8_32_sint;

m8_32 u_8_32 (/*AUTOINST*/
                 .clk_4f (clk_4f),
				 .data_input  (data_input[7:0]), 
				 .valid_input (valid_input),
				 .reset (reset),
				 .data_8_32  (data_8_32 [31:0]),
				 .valid_8_32 (valid_8_32)

);

m8_32_tester t_8_32 (/*AUTOINST*/
                 .clk_4f (clk_4f),
				 .data_input  (data_input [7:0]), 
				 .valid_input (valid_input),
				 .reset (reset),
				 .data_8_32  (data_8_32 [31:0]),
                 .data_8_32_sint (data_8_32_sint [31:0]),
				 .valid_8_32 (valid_8_32),
                 .valid_8_32_sint (valid_8_32_sint)

);

sin_m8_32 ts_8_32 (/*AUTOINST*/
                 .clk_4f (clk_4f),
				 .data_input  (data_input [7:0]), 
				 .valid_input (valid_input),
				 .reset (reset),
                 .data_8_32_sint (data_8_32_sint [31:0]),
                 .valid_8_32_sint (valid_8_32_sint)

);

endmodule