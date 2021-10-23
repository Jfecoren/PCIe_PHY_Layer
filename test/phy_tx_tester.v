// PHY Layer Transmision block Tester


module TX_TESTER(data_out_0, data_out_1, data_in, valid_in, reset, clk_32f, clk_2f);
	input data_out_0, data_out_1;
	input valid_out_0, valid_out_1;
  	input clk_2f;
	output reg [31:0] data_in;
	output reg valid_in, reset, clk_32f;


  initial begin
    $dumpfile("phy_tx.vcd");
    $dumpvars;
    {valid_in, reset} = 2'b00;
    #64 {valid_in, reset} = 2'b11;

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
  always #32 clk_32f <= ~clk_32f;
endmodule
