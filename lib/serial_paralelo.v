module serial_paralelo(input data_in,
                       input clk_4f,
                       input clk_32f,
                       input reset,
                       output reg valid_out,
                       output reg [7:0] data_out);
    reg [2:0] bc_counter;
    reg [7:0] data2send, wait_buffer;
    reg [4:0] counter;
    reg active;
    always @(posedge clk_32f)
        begin
            if(~reset)
                begin
                    bc_counter <= 0;
                    counter <= 0;
                    active <= 0;
                    wait_buffer <= 0;
                    data2send <= 0;
                    data_out <= 0;
                    valid_out <= 0;
                end
            else
                begin
                    wait_buffer <= {wait_buffer[6:0], data_in};
                    if(counter == 8)
                        begin
                            counter <= 1;
                            data2send <= {wait_buffer[6:0], data_in};
                            if(data2send == 8'hBC & bc_counter < 3)
                                bc_counter <= bc_counter + 1;
                            else if(~active & bc_counter == 3)
                                begin
                                    active <= 1;
                                    bc_counter <= bc_counter + 1;
                                end
                            else if(active & bc_counter >= 3 & data2send == 8'hBC)
                                begin
                                    data_out <= data2send;
                                    valid_out <= 0;
                                end
                            else if(active & bc_counter >= 3 & data2send != 8'hBC)
                                begin
                                    data_out <= data2send;
                                    valid_out <= 1;
                                end
                        end
                    else
                        begin
                            counter <= counter + 1;
                        end
                        
                end
        end
endmodule