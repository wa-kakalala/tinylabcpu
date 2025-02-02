`timescale 1ns / 1ps

module top_cpu (
  input  clk    ,
  input  rst    
);

wire        en_ram_out  ;
wire [15:0] addr        ;
wire [15:0] ins         ;

cpu cpu_inst(
    .clk       (clk       ),
    .rst       (rst       ),
    .addr      (addr      ),
    .ins       (ins       ),
    .en_ram_in (en_ram_in ),
    .en_ram_out(en_ram_out)
);

rom rom_inst (
    .clk   (clk       ),           
    .rst   (rst       ),
    .ready (en_ram_in ), 
    .addr  (addr      ),      
    .dout  (ins       ),
    .en_out(en_ram_out) 
);

endmodule
