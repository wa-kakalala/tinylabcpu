/**************************************
@ filename    : sram.v
@ author      : fangyzh26
@ update by   : yyrwkk
@ create time : 2025/02/21 21:18:05
@ version     : v1.0.0
**************************************/
module sram # (
    parameter N_WIDTH  =  32    ,
    parameter N_ADDR   =  10      
)(
    input                        clk  ,
    input                        rst_n,
    input                        en   ,
    // 1 : write , 0 : read 
    input                        we   ,
    input      [N_ADDR-1:0 ]     addr ,
    input      [N_WIDTH-1:0]     din  ,

    output reg [N_WIDTH-1:0]     dout
);

reg [N_WIDTH-1:0] mem [(1<<N_ADDR) -1:0]; 

always @(posedge clk or negedge rst_n) begin
    if( en & we ) begin 
        mem[addr] <= din ;
    end
end

always @( posedge clk or negedge rst_n ) begin 
    if( ! rst_n ) begin 
        dout <= 'b0;
    end else if( en & ( ~we ) ) begin 
        dout <= mem[addr];
    end else begin 
        dout <= dout;
    end
end
    
endmodule
