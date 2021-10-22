// PHY Layer Reception block Tester

module RX_TESTER(data_in_0, data_in_1, valid_in_0, valid_in_1, data_out, valid_out, reset, clk_32f, clk_2f);
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
					data_in_0 <= //8'hFFDD_FFDD;
                    data_in_1 <=
				@(posedge clk_32f)
					data_in_0 <= //32'hEEAA_EEAA;
                    data_in_1 <=
				@(posedge clk_32f)
					data_in_0 <= //32'hDDFF_AABB;
                    data_in_1 <=
				@(posedge clk_32f)
					data_in_0 <= //32'hCABF_FABC;
                    data_in_1 <=
			end
    $finish;
  end

  // Clock
  initial clk_2f = 0;
  always #32 clk_2f <= ~clk_2f;
endmodule
