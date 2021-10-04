/* PHY Layer for PCIe Interface
 * 8-32b module
 * Created: October 3, 2021
 *
 */
// 8-32b module
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