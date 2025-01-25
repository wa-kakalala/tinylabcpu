`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 20:34:27
// Design Name: 
// Module Name: tb_top_cpu
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


`timescale 1ns / 1ps

module tb_top_cpu();

reg clk, rst;
wire [15:0] ins;
wire        en_ram_in;
wire        en_ram_out;
wire [15:0] addr;

parameter Tclk = 10;

cpu test_cpu(
    .clk (clk),
    .rst (rst),
    .en_ram_in (en_ram_in), 
    .en_ram_out(en_ram_out),
    .ins (ins),	
    .addr (addr)
);

rom tb_rom (
  .clk(clk),    
  .rst(rst),
  .ready(en_ram_in),
  .addr(addr),  
  .dout(ins),
  .en_out(en_ram_out)  
);

initial begin
                      clk = 1;
    forever #(Tclk/2) clk = ~clk;
end

initial begin
                rst = 0;
    #(Tclk*12)   rst = 1;
end

endmodule

