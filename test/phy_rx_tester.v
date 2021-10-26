// PHY Layer Reception block Tester

module RX_TESTER(data_out, valid_out, data_in_0, data_in_1, reset, reset_clk, clk_32f, sincout);
    input [31:0] data_out;
	input valid_out;
    output reg clk_32f;
    output reg data_in_0, data_in_1;
	output reg reset, reset_clk, sincout;

	reg delay0, delay1, delay2, delay3;
  initial begin
    $dumpfile("phy_rx.vcd");
    $dumpvars;
    {reset, reset_clk, sincout} = 0;
	#4 reset_clk = 1;
	#64 reset = 1;
	// HEX BC to enable reception 
	repeat (4)
		begin
			@(posedge clk_32f)
				data_in_0 <= 1;
			@(negedge clk_32f)
      			delay0 <= 1;
			@(posedge clk_32f)
				data_in_0 <= 0;
			@(negedge clk_32f)
      			delay0 <= 0;
			@(posedge clk_32f)
				data_in_0 <= 1;
			@(negedge clk_32f)
      			delay0 <= 1;
			@(posedge clk_32f)
				data_in_0 <= 1;
			@(negedge clk_32f)
      			delay0 <= 1;
			@(posedge clk_32f)
				data_in_0 <= 1;
			@(negedge clk_32f)
      			delay0 <= 1;
			@(posedge clk_32f)
				data_in_0 <= 1;
			@(negedge clk_32f)
      			delay0 <= 1;
			@(posedge clk_32f)
				data_in_0 <= 0;
			@(negedge clk_32f)
      			delay0 <= 0;
			@(posedge clk_32f)
				data_in_0 <= 0;
			@(negedge clk_32f)
      			delay0 <= 0;
		end
	
    repeat (4)
			begin
				@(posedge clk_32f)
					data_in_0 <= 1;	// AA
				@(negedge clk_32f)
          			delay0 <= 0;	// 66
				@(posedge clk_32f)
					data_in_0 <= 0;
				@(negedge clk_32f)
          			delay0 <= 1;
				@(posedge clk_32f)
					data_in_0 <= 1;
				@(negedge clk_32f)
          			delay0 <= 1;
				@(posedge clk_32f)
					data_in_0 <= 0;
				@(negedge clk_32f)
          			delay0 <= 0;
			end
	repeat (4)
			begin
				@(posedge clk_32f)
					data_in_0 <= 0;	//55
				@(negedge clk_32f)
          			delay0 <= 1; //DD
				@(posedge clk_32f)
					data_in_0 <= 1;
				@(negedge clk_32f)
          			delay0 <= 1;
				@(posedge clk_32f)
					data_in_0 <= 1;
				@(negedge clk_32f)
          			delay0 <= 0;
				@(posedge clk_32f)
					data_in_0 <= 1;
				@(negedge clk_32f)
          			delay0 <= 1;
			end
	repeat (4)
			begin
				@(posedge clk_32f)
					data_in_0 <= 0;	//66
				@(negedge clk_32f)
          			delay0 <= 0;	//33
				@(posedge clk_32f)
					data_in_0 <= 1;
				@(negedge clk_32f)
          			delay0 <= 0;
				@(posedge clk_32f)
					data_in_0 <= 1;
				@(negedge clk_32f)
          			delay0 <= 1;
				@(posedge clk_32f)
					data_in_0 <= 0;
				@(negedge clk_32f)
          			delay0 <= 1;
			end
			// After Long Delay //00//FF
    #1000 $finish;
  end

  // Clock
  initial clk_32f = 0;
  always #1 clk_32f <= ~clk_32f;

  always @(posedge clk_32f)
	begin
		delay1 <= delay0;
		delay2 <= delay1;
		delay3 <= delay2;
		//delay4 <= delay3;
		data_in_1 <= delay3;
	end
endmodule
