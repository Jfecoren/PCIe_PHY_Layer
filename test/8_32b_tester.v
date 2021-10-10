// Probador modulo for m8_32
// m8_32 probador
module m8_32_tester(
                input  [7:0] data_8_32,
				input  valid_8_32,
                output reg clk_4f,
				output reg [31:0] data_input,
				output reg valid_input,
				output reg reset
				);


    initial begin 
        // DUMPFILE 
        $dumpfile("m8_32.vcd");
        $dumpvars

        // Asignacion de valores
		data_input = 8'b00000000;
		valid_input = 1'b0;
		reset = 1'b0;
		
        // Repite 4 veces
        @(posedge clk_4f);	

		repeat (4)
			begin
				@(posedge clk_4f)
                    reset <= 1;
					data_input <= 8'hEE;
                    valid_input <= 1;
				@(posedge clk_4f)
					data_input <= 8'hAA;
                    valid_input <= 0;
				@(posedge clk_4f)
					data_input <= 8'hAA;
                    valid_input <= 1;
				@(posedge clk_4f)
					data_input <= 32'hEE;
                    valid_input <= 1;
			end
		$finish;
	end

    initial clk_4f <= 0;
	always #1 clk_4f <= ~clk_4f;

	initial clk_2f <= 0;
	always #2 clk_2f <= ~clk_2f;

	initial clk_f <= 0;
	always #4 clk_f <= ~clk_f;

endmodule 