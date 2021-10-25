

module buffer6(data_out, data_in, clk);
output reg data_out;
input data_in, clk;
reg buffer0, buffer1, buffer2, buffer3, buffer4, buffer5;

always @(posedge clk)
    begin
        buffer0 <= data_in;
        buffer1 <= buffer0;
        buffer2 <= buffer1;
        buffer3 <= buffer2;
        buffer4 <= buffer3;
        buffer5 <= buffer4;
        data_out <= buffer5;
    end


endmodule