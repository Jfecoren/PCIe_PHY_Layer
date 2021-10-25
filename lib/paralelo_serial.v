module paralelo_serial(input clk_4f,
                        input clk_32f,
                        input [7:0] data_in,
                        input valid_in,
                        input reset,
                        output reg data_out);

    reg [2:0] selector;
    reg [7:0] data2send;
    reg flag;

    always @(posedge clk_4f)
        begin
            if(reset)
                begin
                    flag <= 1;
                    if (~valid_in)
                        data2send <= 8'hBC;
                    else if(valid_in)
                        begin
                            data2send <= data_in;
                        end

                end
        end
   
    always @(negedge clk_32f)
        begin
            if(~reset)
                begin
                    selector <= 0;
                    data2send <= 0;
                    flag <= 0;
                end
            else if(flag)
                begin
                    selector <= selector + 1;
                    data_out <= data2send[7 - selector];
                end
        end
endmodule 
