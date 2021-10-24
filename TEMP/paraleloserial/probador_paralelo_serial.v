module probador_paralelo_serial( input data_out,
                                 output reg clk_32f,
                                 output reg clk_4f,
                                 output reg [7:0] data_in,
                                 output reg valid_in);
    initial begin
    $dumpfile("paralelo_serial.vcd");
    $dumpvars;

    {valid_in} <= 0;
    data_in <= 8'h00;
    @(posedge clk_4f);
        valid_in <= 0;
        data_in <= 8'h00;

    @(posedge clk_4f);
        valid_in <= 1;
        data_in <= 8'hAA;

    @(posedge clk_4f);
        valid_in <= 1;
        data_in <= 8'hBB;

    @(posedge clk_4f);
        valid_in <= 1;
        data_in <= 8'hCC;

    @(posedge clk_4f);
        valid_in <= 1;
        data_in <= 8'hDD;

    @(posedge clk_4f);
        valid_in <= 0;
        data_in <= 8'hEA;

    @(posedge clk_4f);
        valid_in <= 1;
        data_in <= 8'hFF;

    @(posedge clk_4f);
        valid_in <= 1;
        data_in <= 8'hAA;

    @(posedge clk_4f);
        valid_in <= 1;
        data_in <= 8'hBA;

    @(posedge clk_4f);
        $finish;
    end

    initial clk_4f <= 0;
	always #8 clk_4f <= ~clk_4f;

	initial clk_32f <= 1;
	always #1 clk_32f <= ~clk_32f;

endmodule 