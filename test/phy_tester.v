

module PHY_TESTER(data_out, valid_out, data_in, valid_in, reset, clk_32f, clk_2f);
	input [31:0] data_out;
	input valid_out;
	output reg [31:0] data_in;
	output reg valid_in, reset, clk_32f;
	
	input clk_2f;
	initial begin
		$dumpfile("phy.vcd");
		$dumpvars;
		// Initialize inputs
		{data_in, reset, valid_in} = 'b0;
		#128 reset = 1;
		#1024;
		repeat (8)
			begin
				@(posedge clk_2f)
					valid_in <= 1;
			end
		
		
		repeat (2)
			begin
				@(posedge clk_2f)
					data_in <= 32'hFFFF_FFFF;
				@(posedge clk_2f)
					data_in <= 32'hEEEE_EEEE;
				@(posedge clk_2f)
					data_in <= 32'hDDDD_DDDD;
				@(posedge clk_2f)
					data_in <= 32'hCCCC_CCCC;
				@(posedge clk_2f)
					data_in <= 32'hFFFF_FFFF;
				@(posedge clk_2f)
					data_in <= 32'hEEEE_EEEE;
				@(posedge clk_2f)
					data_in <= 32'hDDDD_DDDD;
				@(posedge clk_2f)
					data_in <= 32'hCCCC_CCCC;
			end
		#10000 $finish;
	end
	
	
	
	// Clock
	initial clk_32f = 0;
	always #64 clk_32f <= ~clk_32f;
endmodule
