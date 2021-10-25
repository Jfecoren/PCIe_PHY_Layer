

module clk_tester(
    input clk_f,
    input clk_2f,
    input clk_4f,
    output reg clk_32f,
    output reg reset);

    initial begin
        $dumpfile("clk_gen.vcd");
        $dumpvars;
        reset = 0;
        #16 reset = 1;

        #1024 $finish;

    end
        // Clock
        initial clk_32f = 0;
        always #2 clk_32f <= ~clk_32f;
endmodule