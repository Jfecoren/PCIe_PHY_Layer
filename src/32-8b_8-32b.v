/* PHY Layer for PCIe Interface
 * 32b_8b & 8b_32b modules
 * Created: October 3, 2021
 *
 */

 module 32b_8b (
     input clk,
     input [31:0] data_in,
     output [7:0] data_out);
     