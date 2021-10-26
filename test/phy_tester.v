

module PHY_TESTER(data_out, valid_out, data_in, valid_in, reset, reset_clk, clk_32f, sincronizar_bus);
	input [31:0] data_out;
	input valid_out;
	output reg [31:0] data_in;
	output reg valid_in, reset, reset_clk, clk_32f;
	output reg sincronizar_bus;
	reg clk_2f;
	initial begin
		$dumpfile("phy.vcd");
		$dumpvars;
		// Initialize inputs
		{data_in, reset, reset_clk, valid_in, sincronizar_bus} = 'b0;
		#4 reset_clk = 1;
		#64 reset = 1;
		#64 valid_in = 1;
		@(posedge clk_2f)
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
		#1000 $finish;
	end
	
	
	
	// Clock
	initial clk_2f = 0;
	always #16 clk_2f <= ~clk_2f;
	initial clk_32f = 0;
	always #1 clk_32f <= ~clk_32f;
endmodule
