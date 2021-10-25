// PHY Layer Transmision block Tester


module TX_TESTER(data_out_0, data_out_1, data_in, valid_in, reset, reset_clk, clk_32f);
	input data_out_0, data_out_1;
	input valid_out_0, valid_out_1;
	output reg [31:0] data_in;
	output reg valid_in, reset, reset_clk, clk_32f;

	reg clk_2f;
  initial begin
    $dumpfile("phy_tx.vcd");
    $dumpvars;
    {valid_in, reset, reset_clk} = 3'b000;
	#16 reset_clk = 1;
    #128 reset = 1;
	#128 valid_in = 1;

    repeat (8)
			begin
				@(posedge clk_2f)
					data_in <= 32'hFFDD_FFDD;
				@(posedge clk_2f)
					data_in <= 32'hEEAA_EEAA;
				@(posedge clk_2f)
					data_in <= 32'hDDFF_AABB;
				@(posedge clk_2f)
					data_in <= 32'hCABF_FABC;
			end
    $finish;
  end

  // Clock
  initial clk_32f = 0;
  always #1 clk_32f <= ~clk_32f;
  initial clk_2f = 0;
  always #16 clk_2f <= ~clk_2f;
endmodule
