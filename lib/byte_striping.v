/* PHY Layer for PCIe Interface
 * Byte striping module
 * Created: September 30, 2021
 *
 */
// Byte Striping
module BYTE_STRIPING(lane_0, lane_1, valid_0, valid_1, data_in, valid_in, clk_2f, clk_f);
	output reg [31:0] lane_0, lane_1;
	output reg valid_0, valid_1;
	input [31:0] data_in;
	input valid_in;
	input clk_2f, clk_f;

	always @(posedge clk_2f)
				begin
					if(~clk_f)
						begin
							valid_0 <= valid_in;
							lane_0 <= (valid_in ? data_in:'b0);
						end
					else if(clk_f)
						begin
							valid_1 <= valid_in;
							lane_1 <= (valid_in ? data_in:'b0);
						end
					else 
						begin
							valid_0 <= 0;
							valid_1 <= 0;
							lane_0 <= 'b0;
							lane_1 <= 'b0;
						end
				end

endmodule
