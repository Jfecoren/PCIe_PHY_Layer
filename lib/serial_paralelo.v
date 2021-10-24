module serial_paralelo(input data_in,
                       input clk_4f,
                       input clk_32f,
                       output reg valid_out,
                       output reg [7:0] data_out);
    reg BC_counter=0; // contador de BC
    reg active=0;
    reg [7:0] data2send; //  DATOS A ENVIAR
    reg [2:0] i = 0; //  contador
    reg t0, t1, t2, t3, t4, t5, t6, t7; // Registros temporales para guardadar los 8 bits de data_in
    
    reg buffer0, buffer1, buffer2, buffer3, buffer4, buffer5, buffer6;
	
	always @(posedge clk_32f)
		begin
			buffer0 <= data_in;
			buffer1 <= buffer0;
			buffer2 <= buffer1;
			buffer3 <= buffer2;
			buffer4 <= buffer3;
			buffer5 <= buffer4;
			buffer6 <= buffer5;
		end
    
    always @(posedge clk_32f) begin

        if (i==3'b000) begin
            t0<=buffer6;
            i<=3'b001;
        end
        if (i==3'b001) begin
            t1<=buffer6;
            i<=3'b011;
        end
        if (i==3'b011) begin
            t2<=buffer6;
            i<=3'b101;
        end
        if (i==3'b101) begin
            t3<=buffer6;
            i<=3'b100;
        end
        if (i==3'b100) begin
            t4<=buffer6;
            i<=3'b110;
        end
        if (i==3'b110) begin
            t5<=buffer6;
            i<=3'b010;
        end
        if (i==3'b010) begin
            t6<=buffer6;
            i<=3'b111;
        end
        if (i==3'b111) begin
            t7<=buffer6;
            i<=3'b000;
        end

    end

    always @(posedge clk_4f) begin
        i<=3'b000;
        data2send[0]<=t7;
        data2send[1]<=t6;
        data2send[2]<=t5;
        data2send[3]<=t4;
        data2send[4]<=t3;
        data2send[5]<=t2;
        data2send[6]<=t1;
        data2send[7]<=t0;

        if (active==1 & data2send==8'hBC) begin
            valid_out<=0;
        end

        if (data2send== 8'hBC) begin
            BC_counter <= BC_counter + 1;
        end

        if (BC_counter==4) begin
            active<=1;
        end

        if (active==1 & data2send!=8'hBC) begin
            data_out<=data2send;
            valid_out<=1;
        end

    end

endmodule          
