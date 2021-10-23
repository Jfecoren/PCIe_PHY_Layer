// PHY Layer Reception block Tester

module RX_TESTER(data_out, valid_out, data_in_0, data_in_1, valid_in_0, valid_in_1, reset, clk_32f, clk_2f);
    input reg [31:0] data_out;
	  input reg valid_out;
    input clk_32f;
    output [7:0] data_in_0, data_in_1;
	  output valid_in_0, valid_in_1, reset, clk_2f;

  initial begin
    $dumpfile("phy_rx.vcd");
    $dumpvars;
    {valid_in_0, valid_in_1, reset} = 2'b00;
    #64 {valid_in_0, valid_in_1, reset} = 2'b11;

    repeat (8)
			begin
				@(posedge clk_32f)
					data_in_0 <= 8'hFF;
          data_in_1 <= 8'hDD;
				@(posedge clk_32f)
					data_in_0 <= 8'hEE;
          data_in_1 <= 8'hAA;
				@(posedge clk_32f)
					data_in_0 <= 8'hDD;
          data_in_1 <= 8'hFF;
				@(posedge clk_32f)
					data_in_0 <= 8'hCA;
          data_in_1 <= 8'hBF;
			end
    $finish;
  end

  // Clock
  initial clk_32f = 0;
  always #32 clk_32f <= ~clk_32f;
endmodule
