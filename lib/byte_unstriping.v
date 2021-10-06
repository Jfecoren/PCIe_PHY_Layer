/* PHY Layer for PCIe Interface
 * Byte un-striping module
 * Created: September 30, 2021
 *
 */
// Byte Un-Striping
module BYTE_UNSTRIPING(data_out, valid_out, lane_0, lane_1, valid_0, valid_1, clk_2f, clk_f);
	output reg [31:0] data_out;
	output reg valid_out;
	input [31:0] lane_0, lane_1;
	input valid_0, valid_1, clk_2f, clk_f;
	
	always @(posedge clk_2f)
			begin
				if(~clk_f)
					begin
						valid_out <= valid_0;
						data_out <= (valid_0 ? lane_0:'b0);
					end
				else
					begin
						valid_out <= valid_1;
						data_out <= (valid_1 ? lane_1:'b0);
					end
			end

endmodule
