`timescale 	1s	/ 1s
`include "clk_gen.v"
`include "clk_gen_tester.v"


module BancoPruebas;
    wire clk_f;
    wire clk_2f;
    wire clk_4f;
    wire clk_32f;
	wire reset;

    clk_gen GenInst(/*AUTOINST*/
		 // Outputs
		 .clk_f			(clk_f),
		 .clk_2f		(clk_2f),
		 .clk_4f		(clk_4f),
		 // Inputs
		 .reset			(reset),
		 .clk_32f		(clk_32f));
    probador prob(/*AUTOINST*/
		  // Outputs
		  .reset		(reset),
		  .clk_32f		(clk_32f),
		  // Inputs
		  .clk_f		(clk_f),
		  .clk_2f		(clk_2f),
		  .clk_4f		(clk_4f));

endmodule
