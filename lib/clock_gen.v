module clk_gen(
    output reg clk_f,
    output reg clk_2f,
    output reg clk_4f,
    input reset,
    input clk_32f);

    reg q1=0, q2=0;

    always @(posedge clk_32f)
        begin
            if (reset == 0) begin
                clk_4f <= 0;
                clk_2f <= 0;
                clk_f <= 0;
            end
            else begin
                q1 <= ~q1; 
            end
        end
    always @(negedge q1)
        begin
            q2 <= ~q2;
        end
    always @(negedge q2)
        begin
                clk_4f <= ~clk_4f;
        end
    always @(negedge clk_4f)
        begin
                clk_2f <= ~clk_2f;
        end
    always @(negedge clk_2f)
        begin
                clk_f <= ~clk_f;
        end
    
endmodule