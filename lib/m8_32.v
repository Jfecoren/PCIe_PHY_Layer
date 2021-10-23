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
				input clk_4f,
				input clk_32f);

	reg [31:0] buffer;
	integer contador;
	
	always @(posedge clk_32f) begin
			if(reset == 0) begin
				contador <= 0;
				valid_8_32 <= 0;
				data_8_32 <= 0;
				buffer <= 0;
			end
		end
		
	always @(posedge clk_4f)
		 if(reset) begin
			if(valid_input == 1) begin
				buffer = {buffer[23:0], data_input};
				if (contador == 3) begin
					data_8_32 <= buffer;
					valid_8_32 <= 1;
				end
				contador <= contador + 1;

				if(contador >= 3) contador <= 0;
			end
			else begin			//Caso valid_input 0
				if (contador == 4) begin
					valid_8_32 <= 0;
					contador <= 0;
				end
				contador =contador + 1;
			end
		end


endmodule
