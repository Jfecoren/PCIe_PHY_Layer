


`include "phy.v"
`include "phy_tester.v"

module PHY_TESTBENCH;
	wire [31:0] data_out, data_in;
	wire valid_out, valid_in;
	wire clk_32f, reset;
	
	
	PHY elmodulito(/*AUTOINST*/);
	
	PHY_TESTER eltestesito(/*AUTOINST*/);

endmodule;
