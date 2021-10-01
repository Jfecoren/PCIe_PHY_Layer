/* PHY Layer for PCIe Interface
 * Byte striping & un-striping modules
 * Created: September 30, 2021
 *
 */
// Byte Striping
module BYTE_STRIPING(lane_0, lane_1, valid_0, valid_1, data_in, valid_in, clk_2f, clk_f);
	output reg [31:0] lane_0, lane_1;
	output reg valid_0, valid_1;
	input [31:0] data_in;
	input valid_in, clk_2f, clk_f;
	
	@(posedge clk_f)
		lane_0 <= data_in;
		valid_0 <= valid_in;
	
	@(posedge clk_f)
		lane_1 <= data_in;
		valid_1 <= valid_in;
	
endmodule


// Byte Un-Striping
module BYTE_UNSTRIPING(data_out, valid_out, lane_0, lane_1, valid_0, valid_1, clk_2f, clk_f);
	output reg [31:0] data_out;
	output reg valid_out;
	input [31:0] lane_0, lane_1;
	input valid_0, valid1, clk_2f, clk_f;

	@(posedge clk_2f)
		data_out <= lane_0;
		valid_out <= valid_0;
	@(posedge clk_2f)
		data_out <= lane_1;
		valid_out <= valid_1;

endmodule
