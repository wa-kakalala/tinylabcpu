`timescale 1ns / 1ps  

module alu_mux (
	input             clk        , 
	input             rst        ,  
	input             en_in      ,
	input      [ 7:0] offset     , 
	input      [15:0] rd_q       ,
	input      [15:0] rs_q       , 
	input             alu_in_sel ,
	output reg [15:0] alu_a      ,
	output reg [15:0] alu_b      ,
	output reg        en_out      
);

always @(posedge clk or negedge rst) begin 
	if( rst == 1'b0 ) begin 
		alu_a <= 'b0;
	end else if( en_in == 1'b1 ) begin 
		alu_a <= rd_q;
	end else begin 
		alu_a <= alu_a;
	end
end 

always @(posedge clk or negedge rst) begin 
	if( rst == 1'b0 ) begin 
		alu_b <= 'b0;
	end else if( en_in == 1'b1 ) begin 
		alu_b <= (alu_in_sel ==1'b0 ) ? ({8'b00000000,offset[7:0]}) : rs_q ;	
	end else begin 
		alu_b <= alu_b;
	end
end 

always @(posedge clk or negedge rst) begin 
	if( rst == 1'b0 ) begin 
		en_out <= 1'b0;
	end else if( en_in == 1'b1 ) begin 
		en_out <= 1'b1;
	end else begin 
		en_out <= 1'b0;
	end                                                           
end 

endmodule