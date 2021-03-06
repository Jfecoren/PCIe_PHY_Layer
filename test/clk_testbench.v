`timescale 1s/1s

`include "cmos_cells.v"
`include "clk_gen.v"
//`include "clk_gen_synth.v"
`include "clk_tester.v"

module clk_testbench;

wire clk_32f, clk_4f, clk_2f, clk_f, reset_clk;

clk_gen relojM(.clk_32f     (clk_32f),
                .clk_4f     (clk_4f),
                .clk_2f     (clk_2f),
                .clk_f      (clk_f),
                .reset_clk  (reset_clk)
);

clk_tester probar(.clk_32f     (clk_32f),
                    .clk_4f     (clk_4f),
                    .clk_2f     (clk_2f),
                    .clk_f      (clk_f),
                    .reset      (reset_clk)
);

endmodule