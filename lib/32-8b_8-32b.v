/* PHY Layer for PCIe Interface
 * 32-8b module
 * Created: October 3, 2021
 *
 */
// 32-8b module
module demux_32_8(input clk_4f,
				input [31:0] data_demux_strp,
				input valid_demux_strp,
				input reset,
				output reg [7:0] data_demux_32_8,
				output reg valid_demux_32_8); //tiene que ser reg para poder ser l-value

	reg [1:0] selector = 2'b00;

	always @(posedge clk_4f) begin
		if(reset == 0 || valid_demux_strp == 0) begin
			selector [1:0] <= 2'b00;
			valid_demux_32_8 <= 0;
			data_demux_32_8 <= 8'h00;
		end
		else if(reset==1) begin
			if(valid_demux_strp == 1) begin
				if(selector == 2'b00) begin
					data_demux_32_8 <= data_demux_strp [31:24];
					valid_demux_32_8 <= valid_demux_strp;
					selector <= 2'b01;
				end
				else if(selector == 2'b01) begin
					data_demux_32_8 <= data_demux_strp [23:16];
					valid_demux_32_8 <= valid_demux_strp;
					selector <= 2'b10;
				end
				else if(selector[1] == 1 && selector[0] == 0) begin
					data_demux_32_8 <= data_demux_strp [15:8];
					valid_demux_32_8 <= valid_demux_strp;
					selector <= 2'b11;
				end
				else if(selector == 2'b11) begin
					data_demux_32_8<= data_demux_strp[7:0];
					valid_demux_32_8 <= valid_demux_strp;
					selector <= 2'b00;
				end
			end
		end
	end


endmodule