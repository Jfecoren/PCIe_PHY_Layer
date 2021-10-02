// Tester modules for Byte Striping & Un-striping

// Tester module for Byte Striping
module TESTER_STRIPING(lane_0, lane_1, valid_0, valid_1, data_in, valid_in, clk_2f, clk_f);
	input [31:0] lane_0, lane_1;
	input valid_0, valid_1;
	output reg [31:0] data_in;
	output reg valid_in, clk_2f, clk_f;

	initial begin
		$dumpfile("byte_sus.vcd");
		$dumpvars;
		// Initialize inputs
		data_in = 'b0;
		valid_in = 1;
		
		#3
		repeat (4)
			begin
				@(posedge clk_2f)
					data_in <= 32'hFFFF_FFFF;
				@(posedge clk_2f)
					data_in <= 32'hEEEE_EEEE;
				@(posedge clk_2f)
					data_in <= 32'hDDDD_DDDD;
				@(posedge clk_2f)
					data_in <= 32'hCCCC_CCCC;
			end
		$finish;
	end
	
	initial clk_2f <= 0;
	always #8 clk_2f <= ~clk_2f;
	initial clk_f <= 0;
	always @(posedge clk_2f) clk_f <= ~clk_f;
endmodule


// Tester module for Byte Un-striping
module TESTER_UNSTRIPING(lane_0, lane_1, valid_0, valid_1, data_out, valid_out, clk_2f, clk_f);
	output reg [31:0] lane_0, lane_1;
	output reg valid_0, valid_1;
	input [31:0] data_out;
	input valid_out;
	output reg clk_2f, clk_f;

	initial begin
		// Initialize inputs
		{lane_0, lane_1} = 'b0;
		{valid_0, valid_1} = 2'b11;
		
		#3
		repeat (8)
			begin
				@(posedge clk_f)
					lane_0 <= 32'hFFFF_FFFF;
					lane_1 <= 32'hEEEE_EEEE;
				@(posedge clk_f)
					lane_0 <= 32'hDDDD_DDDD;
					lane_1 <= 32'hCCCC_CCCC;
			end
	end
	
	initial clk_2f <= 0;
	always #8 clk_2f <= ~clk_2f;
	initial clk_f <= 0;
	always @(posedge clk_2f) clk_f <= ~clk_f;
endmodule
