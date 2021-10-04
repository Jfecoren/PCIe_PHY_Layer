/* PHY Layer for PCIe Interface
 * 32-8b & 8-32b modules
 * Created: October 3, 2021
 *
 */
// 32-8b/8-32b modules
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

module demux_8_32(input clk_4f,
				input [7:0] data_serial_paralelo,
				input valid_serial_paralelo,
				input reset,
				output reg [31:0] data_demux_8_32,
				output reg valid_demux_8_32); //tiene que ser reg para poder ser l-value

	reg [31:0] buffer;
	integer contador;


	always @(posedge clk_4f) begin
		if(reset == 0) begin
			contador <= 0;
			valid_demux_8_32 <= 0;
			data_demux_8_32 <= 0;
			buffer <= 0;
		end
		else begin
			if(valid_serial_paralelo == 1) begin
				buffer = {buffer[23:0], data_serial_paralelo};
				if (contador == 3) begin
					data_demux_8_32 <= buffer;
					valid_demux_8_32 <= 1;
				end
				contador <= contador + 1;

				if(contador >= 3) contador <= 0;
			end
			else begin			//Caso valid_serial_paralelo 0
				if (contador == 4) begin
					valid_demux_8_32 <= 0;
					contador <= 0;
				end
				contador+= 1;
			end
		end
	end


endmodule