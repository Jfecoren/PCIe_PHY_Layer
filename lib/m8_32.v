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

	reg [31:0] buffer0, buffer1, buffer2, buffer3, buffer4;
	reg boomer0, boomer1, boomer2, boomer3, boomer4;

	always @(posedge clk_32f)
		begin
			if(~reset)
				begin
					data_8_32 <= 0;
					valid_8_32 <= 0;
				end
		end

	always @(posedge clk_4f)
		begin
			boomer0 <= valid_input;
			boomer3 <= boomer0;
			boomer4 <= boomer3;
			if(sinc)
				begin
					boomer1 <= boomer0;
					boomer2 <= boomer1;
				end
			
			if(valid_input) begin
				buffer0 <= {buffer0[23:0], data_input};
				buffer3 <= buffer0;
				buffer4 <= buffer3;
				if (sinc) begin
					buffer1 <= buffer0;
					buffer2 <= buffer1;
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
				data_8_32 <= buffer2;
				valid_8_32 <= boomer2;
			end
	end

	always @(negedge clk_f)
	begin
		if(~sinc)
			begin
				data_8_32 <= buffer4;
				valid_8_32 <= boomer4;
			end
	end
endmodule
