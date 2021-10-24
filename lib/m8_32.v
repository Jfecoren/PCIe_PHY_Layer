/* PHY Layer for PCIe Interface
 * 32-8b & 8-32b modules
 * Created: October 3, 2021
 *
 */
// 32-8b/8-32b modules
module m8_32(output reg [31:0] data_8_32,
				output reg valid_8_32,
				output reg sincout,
				input [7:0] data_input,
				input sinc,
				input valid_input,
				input reset,
				input clk_f,
				input clk_4f,
				input clk_32f);

	reg [31:0] buffer0, buffer1, buffer2, buffer3, buffer4, buffer5;
	reg boomer0, boomer1, boomer2, boomer3, boomer4, boomer5;

	always @(posedge clk_4f)
		begin
			boomer0 <= valid_input;
			boomer1 <= boomer0;
			boomer2 <= boomer1;
			boomer3 <= boomer2;
			if(sinc)
				begin
					boomer4 <= boomer3;
					boomer5 <= boomer4;
				end
			
			if(valid_input) begin
				buffer0 <= {buffer0[23:0], data_input}; 
				buffer1 <= buffer0;
				buffer2 <= buffer1;
				buffer3 <= buffer2;
				if (sinc==1) begin
					buffer4 <= buffer3;
					buffer5 <= buffer4;
					sincout <= 0;
					end
				else
					sincout <=1; 	 
				
			end
		else
			buffer0 <= {buffer0[23:0], 8'hBC};

		end
	
	always @(posedge clk_f)
	begin
		if(sinc)
			begin
				data_8_32 <= buffer5;
				valid_8_32 <= boomer5;
			end
		else
			begin
				data_8_32 <= buffer3;
				valid_8_32 <= boomer3;
			end
	end
endmodule
