module paralelo_serial(input clk_4f,
                        input clk_32f,
                        input [7:0] data_in,
                        input valid_in,
                        input reset,
                        output reg data_out);

    reg [2:0] selector;
    reg [7:0] data2send;

    always @(posedge clk_4f)
        begin
            if (~valid_in)
                data2send <= 8'hBC;
            else
                data2send <= data_in;
        end
   
    always @(posedge clk_32f)
        begin
            if(reset)
                selector <= selector + 1;
            else
                selector <= 0;
            
            data_out <= data2send[7 - selector];
   end
endmodule 
