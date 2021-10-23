/* PHY Layer for PCIe Interface
 * 32-8b & 8-32b modules
 * Created: October 3, 2021
 *
 */
// 32-8b/8-32b modules
module m8_32(output reg [31:0] data_8_32,
				output reg valid_8_32,
				input [7:0] data_input,
				input valid_input,
				input reset,
				input clk_f,
				input clk_4f,
				input clk_32f);

	reg [31:0] buffer0, buffer1, buffer2, buffer3;
	
	always @(posedge clk_32f)
			begin
			if(reset == 0) begin
				valid_8_32 <= 0;
				data_8_32 <= 0;
				buffer0 <= 0;
				buffer1 <= 0;
			end
		end
		
	always @(posedge clk_4f)
			begin
				if(valid_input)
					begin
						buffer0 <= {buffer0[23:0], data_input};
						buffer1 <= buffer0;
						buffer2 <= buffer1;
						buffer3 <= buffer2;
					end
				else//Caso valid_input 0
					valid_8_32 <= 0;
			end
	
	always @(posedge clk_f)
		begin
			data_8_32 <= buffer3;
			valid_8_32 <= 1;
		end
endmodule
