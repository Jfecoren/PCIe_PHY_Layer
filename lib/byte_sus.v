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
	always
		begin
		
			@(posedge clk_2f)
				#0.5
				if(valid_in == 1)
					begin
						lane_0 <= data_in;
						valid_0 <= valid_in;
					end
				else
					begin
						lane_0 <= 'b0;
						valid_0 <= valid_in;
					end
					
			
			@(posedge clk_2f)
				#0.5
				if(valid_in == 1)
					begin
						lane_1 <= data_in;
						valid_1 <= valid_in;
					end
				else
					begin
						lane_1 <= 'b0;
						valid_1 <= valid_in;
					end
		end
endmodule


// Byte Un-Striping
module BYTE_UNSTRIPING(data_out, valid_out, lane_0, lane_1, valid_0, valid_1, clk_2f, clk_f);
	output reg [31:0] data_out;
	output reg valid_out;
	input [31:0] lane_0, lane_1;
	input valid_0, valid_1, clk_2f, clk_f;
	always
		begin
			@(posedge clk_2f)
				#0.5
				if(valid_0 == 1)
					begin
						data_out <= lane_0;
						valid_out <= valid_0;
					end
			@(posedge clk_2f)
				#0.5
				if(valid_0 == 1)
					begin
						data_out <= lane_1;
						valid_out <= valid_1;
					end
		end

endmodule
