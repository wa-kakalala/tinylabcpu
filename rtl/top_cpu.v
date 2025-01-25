`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 
// Design Name: 
// Module Name: top_cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module top_cpu(clk,rst,en_ram_in);

input  clk, rst;
output en_ram_in;
wire   en_ram_out;
wire   [15:0] addr;
wire   [15:0] ins;
  

cpu cpu_0(
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .ins(ins),
    .en_ram_in(en_ram_in),
    .en_ram_out(en_ram_out)
);


rom rom_0 (
  .clk(clk),           
  .rst(rst),
  .ready(en_ram_in), 
  .addr(addr),      
  .dout(ins),
  .en_out(en_ram_out) 
);

endmodule
