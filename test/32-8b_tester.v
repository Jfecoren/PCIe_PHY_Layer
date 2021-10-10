// Probador modulos for demux_32_8 &  demux_8_32

// demux_32_8 probador
module m32_8_tester(
                input  [7:0] data_32_8,
				input  valid_32_8,
				input  [7:0] data_32_8_sint,
				input  valid_32_8_sint,
                output reg clk_4f, clk_f,
				output reg [31:0] data_strp,
				output reg valid_strp,
				output reg reset
				);


    initial begin 
        // DUMPFILE 
        $dumpfile("m32_8.vcd");
        $dumpvars;

        // Asignacion de valores
		data_strp = 32'h00000000;
		valid_strp = 1'b0;
		reset = 1'b0;
		
        // Repite 8 veces

        // Espera/sincroniza con el flanco positivo del reloj	
        @(posedge clk_f);	

		repeat (4)
			begin
				@(posedge clk_f)
                    reset <= 1;
					data_strp <= 32'hAABBAACC;
                    valid_strp <= 1;
					 
				@(posedge clk_f)
					data_strp <= 32'hBBAABBEE;
                    valid_strp <= 1;
					
				@(posedge clk_f)
					data_strp <= 32'hCCAACCDD;
                    valid_strp <= 1;
					
				@(posedge clk_f)
					data_strp <= 32'hAADDEEDD;
                    valid_strp <= 1;
					
				@(posedge clk_f)
					data_strp <= 32'hCCAADDEE;
                    valid_strp <= 0;
			end
		$finish;
	end

    initial clk_4f <= 0;
	always #1 clk_4f <= ~clk_4f;

	initial clk_f <= 0;
	always #4 clk_f <= ~clk_f;


endmodule 