// Probador modulo for m8_32
// m8_32 probador

module m8_32_tester(
                input [31:0] data_8_32,
				input valid_8_32,
				input valid_8_32_sint,
				input [31:0] data_8_32_sint,
				input sincout,
				input sincout_s,
				output reg clk_32f,
                output reg clk_4f,
                output reg clk_f,
				output reg [7:0] data_input,
				output reg valid_input,
				output reg reset,
				output reg sinc
				);

    initial begin 
        // DUMPFILE 
        $dumpfile("m8_32.vcd");
        $dumpvars;

        // Asignacion de valores
		sinc = 0;
		data_input = 8'b00000000;
		valid_input = 1'b1;
		reset = 1'b0;
		
        // Repite 4 veces

		repeat (2)
			begin
				@(posedge clk_4f)
                    reset <= 1;
					data_input <= 8'hEE;
                    valid_input <= 1;
				@(posedge clk_4f)
					data_input <= 8'hAA;
				@(posedge clk_4f)
					data_input <= 8'hFF;
				@(posedge clk_4f)
					data_input <= 8'hDD;
			end

		repeat (2)
			begin
				@(posedge clk_4f)
                    reset <= 1;
					data_input <= 8'hBB;
                    valid_input <= 0;
				@(posedge clk_4f)
					data_input <= 8'h11;
				@(posedge clk_4f)
					data_input <= 8'h22;
				@(posedge clk_4f)
					data_input <= 8'h33;
			end
		
		@(posedge clk_4f)
            valid_input <= 1;

		repeat (2)
			begin
				@(posedge clk_4f)
					data_input <= 8'hBB;
				@(posedge clk_4f)
					data_input <= 8'h11;
				@(posedge clk_4f)
					data_input <= 8'h22;
				@(posedge clk_4f)
					data_input <= 8'h33;
			end
		#64 $finish;
	end

	// Clocks
    initial clk_32f <= 0;
	always #1 clk_32f <= ~clk_32f;
	initial clk_4f <= 0;
	always #4 clk_4f <= ~clk_4f;
	initial clk_f <= 0;
	always #32 clk_f <= ~clk_f;

endmodule