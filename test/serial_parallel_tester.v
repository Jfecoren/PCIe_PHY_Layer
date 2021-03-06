

module serial_parallel_tester (input valid_out,
                                 input valid_out_synth,
                                 input [7:0] data_out,
                                 input [7:0] data_out_synth,
                                 output reg data_in,
                                 output reg clk_4f,
                                 output reg clk_32f,
                                 output reg reset);
    initial begin

        $dumpfile("serial_parallel.vcd");
        $dumpvars;

        {reset} = 0;

        #16 reset = 1;
        //@(posedge clk_4f);
        //Se envia el valor de AA en binario
        @(posedge clk_32f);
            data_in<=1;
        @(posedge clk_32f);
            data_in<=0;
        @(posedge clk_32f);
            data_in<=1;
        @(posedge clk_32f);
            data_in<=0;
        @(posedge clk_32f);
            data_in<=1;
        @(posedge clk_32f);
            data_in<=0;
        @(posedge clk_32f);
            data_in<=1;
        @(posedge clk_32f);
            data_in<=0;
        
        // BC*4: valid signal
        repeat (4)
            begin
                @(posedge clk_32f);
                data_in<=1;
                @(posedge clk_32f);
                data_in<=0;
                @(posedge clk_32f);
                data_in<=1;
                @(posedge clk_32f);
                data_in<=1;
                @(posedge clk_32f);
                data_in<=1;
                @(posedge clk_32f);
                data_in<=1;
                @(posedge clk_32f);
                data_in<=0;
                @(posedge clk_32f);
                data_in<=0;
            end
        //Se envia el valor de BB en binario
        @(posedge clk_32f);
        data_in<=1;
        @(posedge clk_32f);
        data_in<=0;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        //Se envia el valor de CC en binario
        @(posedge clk_32f);
        data_in<=1;
        @(posedge clk_32f);
        data_in<=1;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=0;
        //Se envia el valor de DD en binario
        @(posedge clk_32f);
        data_in<=1;
        @(posedge clk_32f);
        data_in<=1;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=1;
        //Se envia el valor de EE en binario
        @(posedge clk_32f);
        data_in<=1;
        @(posedge clk_32f);
        data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=0;
        //Se envia el valor de BC en binario (5)
        @(posedge clk_32f);
        data_in<=1;
        @(posedge clk_32f);
        data_in<=0;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=0; 
        //Se envia el valor de FF en binario
        @(posedge clk_32f);
        data_in<=1;
        @(posedge clk_32f);
        data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
        @(posedge clk_32f);
         data_in<=1;
      
        //Se envia el valor de 0 en binario
        @(posedge clk_32f);
        data_in<=0;
        @(posedge clk_32f);
        data_in<=0;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=0;
        @(posedge clk_32f);
         data_in<=0;

        #100 $finish;
    
    end 
    initial clk_4f <= 0;
	always #8 clk_4f <= ~clk_4f;

	initial clk_32f <= 0;
	always #1 clk_32f <= ~clk_32f;

endmodule