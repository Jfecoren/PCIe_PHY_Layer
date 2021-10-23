/* PHY Layer for PCIe Interface
 * 32-8b module
 * Created: October 3, 2021
 *
 */
// 32-8b module
module m32_8(output reg [7:0] data_32_8,
				output reg valid_32_8,
				input [31:0] data_strp,
				input valid_strp,
				input reset,
				input clk_4f);

	reg [1:0] selector = 2'b00;

	always @(posedge clk_4f) begin
		if(reset == 0 || valid_strp == 0) begin
			selector [1:0] <= 2'b00;
			valid_32_8 <= 0;
			data_32_8 <= 8'h00;
		end
		else if(reset==1) begin
			if(valid_strp == 1) begin
				if(selector == 2'b00) begin
					data_32_8 <= data_strp [31:24];
					valid_32_8 <= valid_strp;
					selector <= 2'b01;
				end
				else if(selector == 2'b01) begin
					data_32_8 <= data_strp [23:16];
					valid_32_8 <= valid_strp;
					selector <= 2'b10;
				end
				else if(selector[1] == 1 && selector[0] == 0) begin
					data_32_8 <= data_strp [15:8];
					valid_32_8 <= valid_strp;
					selector <= 2'b11;
				end
				else if(selector == 2'b11) begin
					data_32_8<= data_strp[7:0];
					valid_32_8 <= valid_strp;
					selector <= 2'b00;
				end
			end
		end
	end


endmodule

