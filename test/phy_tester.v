

module PHY_TESTER(data_out, valid_out, data_in, valid_in, reset, clk_32f, clk_2f, sincronizar_bus);
	input [31:0] data_out;
	input valid_out;
	output reg [31:0] data_in;
	output reg valid_in, reset, clk_32f;
	output reg sincronizar_bus;
	
	input clk_2f;
	initial begin
		$dumpfile("phy.vcd");
		$dumpvars;
		// Initialize inputs
		{data_in, reset, valid_in, sincronizar_bus} = 'b0;
		#32 reset = 1;
		#32 valid_in = 1;
		
		
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
	initial clk_32f = 0;
	always #2 clk_32f <= ~clk_32f;
endmodule
