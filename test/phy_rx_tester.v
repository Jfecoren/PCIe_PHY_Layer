// PHY Layer Reception block Tester

module RX_TESTER(data_out, valid_out, data_in_0, data_in_1, reset, clk_32f);
    input reg [31:0] data_out;
	  input reg valid_out;
    output clk_32f;
    output data_in_0, data_in_1;
	  output reset;

  initial begin
    $dumpfile("phy_rx.vcd");
    $dumpvars;
    {reset} = 0;
    #64 {reset} = 1;

    repeat (8)
			begin
				@(posedge clk_32f)
					data_in_0 <= 1;
          data_in_1 <= 0;
				@(posedge clk_32f)
					data_in_0 <= 0;
          data_in_1 <= 1;
				@(posedge clk_32f)
					data_in_0 <= 1;
          data_in_1 <= 1;
				@(posedge clk_32f)
					data_in_0 <= 0;
          data_in_1 <= 0;
			end
    $finish;
  end

  // Clock
  initial clk_32f = 0;
  always #32 clk_32f <= ~clk_32f;
endmodule
