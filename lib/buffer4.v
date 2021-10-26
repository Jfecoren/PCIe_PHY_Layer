

module buffer4(data_out, data_in, clk);
output reg data_out;
input data_in, clk;
reg buffer0, buffer1, buffer2, buffer3;

always @(posedge clk)
    begin
        buffer0 <= data_in;
        buffer1 <= buffer0;
        buffer2 <= buffer1;
        buffer3 <= buffer2;
        data_out <= buffer3;
    end


endmodule