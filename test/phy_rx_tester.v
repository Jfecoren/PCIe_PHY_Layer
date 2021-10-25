// PHY Layer Reception block Tester

module RX_TESTER(data_out, valid_out, data_in_0, data_in_1, reset, clk_32f);
    input [31:0] data_out;
	input valid_out;
    output reg clk_32f;
    output reg data_in_0, data_in_1;
	output reg reset;

  initial begin
    $dumpfile("phy_rx.vcd");
    $dumpvars;
    reset = 0;
	#64 reset = 1;
	
	// HEX BC to enable reception 
	repeat (4)
		begin
			@(posedge clk_32f)
				data_in_0 <= 1;
      			data_in_1 <= 1;
			@(posedge clk_32f)
				data_in_0 <= 0;
      			data_in_1 <= 0;
			@(posedge clk_32f)
				data_in_0 <= 1;
      			data_in_1 <= 1;
			@(posedge clk_32f)
				data_in_0 <= 1;
      			data_in_1 <= 1;
			@(posedge clk_32f)
				data_in_0 <= 1;
      			data_in_1 <= 1;
			@(posedge clk_32f)
				data_in_0 <= 1;
      			data_in_1 <= 1;
			@(posedge clk_32f)
				data_in_0 <= 0;
      			data_in_1 <= 0;
			@(posedge clk_32f)
				data_in_0 <= 0;
      			data_in_1 <= 0;
		end
	
    repeat (4)
			begin
				@(posedge clk_32f)
					data_in_0 <= 1;	// AA
          			data_in_1 <= 0;	// 66
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
	repeat (4)
			begin
				@(posedge clk_32f)
					data_in_0 <= 0;	//55
          			data_in_1 <= 1; //DD
				@(posedge clk_32f)
					data_in_0 <= 1;
          			data_in_1 <= 1;
				@(posedge clk_32f)
					data_in_0 <= 1;
          			data_in_1 <= 0;
				@(posedge clk_32f)
					data_in_0 <= 1;
          			data_in_1 <= 1;
			end
	repeat (4)
			begin
				@(posedge clk_32f)
					data_in_0 <= 0;	//66
          			data_in_1 <= 0;	//33
				@(posedge clk_32f)
					data_in_0 <= 1;
          			data_in_1 <= 0;
				@(posedge clk_32f)
					data_in_0 <= 1;
          			data_in_1 <= 1;
				@(posedge clk_32f)
					data_in_0 <= 0;
          			data_in_1 <= 1;
			end
			// After Long Delay //00//FF
    #1000 $finish;
  end

  // Clock
  initial clk_32f = 0;
  always #1 clk_32f <= ~clk_32f;
endmodule
