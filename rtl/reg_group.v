`timescale 1ns / 1ps

module reg_group(
    input             clk   ,       
    input             rst	,	
	input             en_in ,		
	input      [3:0 ] reg_en,		
	input      [15:0] d_in  ,		
	input      [1:0 ] rd    ,
    input      [1:0 ] rs    ,		
	output reg [15:0] rd_q  ,
	output reg [15:0] rs_q  ,
    output            en_out
);

wire [15:0] q [3:0] ;

genvar idx;
generate 
    for( idx = 0;idx<4;idx = idx+1'b1) begin: regfile_block
        register register_inst(
            . clk(clk        ) ,
            . rst(rst        ) ,
            . en (reg_en[idx]) ,                
            . d  (d_in       ) ,                
            . q  (q[idx]     )
        );
    end
endgenerate
  
always@(*) begin 
    if( en_in == 1'b1 ) begin 
        rd_q = q[rd];
    end else begin 
        rd_q = 'b0;
    end
end

always@(*) begin 
    if( en_in == 1'b1 ) begin 
        rs_q = q[rs];
    end else begin 
        rs_q = 'b0;
    end
end

assign en_out = ( en_in ) ? 1'b1: 1'b0;

endmodule               
                        