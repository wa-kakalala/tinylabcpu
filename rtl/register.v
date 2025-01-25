`timescale 1ns / 1ps

module register(
    input             clk ,
    input             rst , 
    input             en  ,
    input      [15:0] d   ,
    output reg [15:0] q
);

always@(posedge clk or negedge rst ) begin 
    if(rst==0) begin 
        q <= 16'b0000_0000_0000_0000;
    end else begin
        if( en== 1'b1 ) begin 
            q <= d;
        end else begin
            q <= q;
        end
    end
end
endmodule
