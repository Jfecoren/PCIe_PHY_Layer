/* PHY Layer for PCIe Interface
 * clk_gen module
 * Created: September 30, 2021
 *
 */
// clk generator

module clk_gen(output reg clk_f,
				output reg clk_2f,
				output reg clk_4f,
				input clk_32f,
				input reset);

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
    always @(posedge q1)
        begin
            q2 <= ~q2;
        end
    always @(posedge q2)
        begin
                clk_4f <= ~clk_4f;
        end
    always @(posedge clk_4f)
        begin
                clk_2f <= ~clk_2f;
        end
    always @(posedge clk_2f)
        begin
                clk_f <= ~clk_f;
        end

endmodule
