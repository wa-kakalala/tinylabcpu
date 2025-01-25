`timescale 1ns / 1ps  

`define B15to0H     3'b000
`define AandBH      3'b011
`define AorBH       3'b100
`define AaddBH      3'b001
`define AsubBH      3'b010
`define leftshift   3'b101
`define rightshift  3'b110

module alu (
	input             clk     ,
	input             rst     , 
	input             en_in   , 
	input      [15:0] alu_a   , 
	input      [15:0] alu_b   , 
	input      [2:0]  alu_func, 
	output reg        en_out  , 
	output reg [15:0] alu_out
);

always @( posedge clk or negedge rst) begin
    if( rst ==1'b0 ) begin
	   	alu_out <= 16'b0000000000000000;
	   	en_out  <= 1'b0;
	end else begin
		if( en_in == 1'b1 ) begin
			en_out  <= 1'b1;
			case (alu_func)
			`B15to0H   :begin
				alu_out <= alu_b;
			end
			`AandBH    :begin
				alu_out <= alu_a & alu_b;
			end 
			`AorBH     :begin
				alu_out <= alu_a | alu_b;
			end  
			`AaddBH    :begin
				alu_out <= alu_a + alu_b ;
			end 
			`AsubBH    :begin
				alu_out <= alu_a - alu_b ;
			end 
			`leftshift :begin
				alu_out <= alu_a << 1'b1 ;
			end  
			`rightshift:begin
				alu_out <= alu_a >> 1'b1;
			end 
			default    :begin
				alu_out <= 16'b0000000000000000;
			end   
			endcase
		end else begin
			en_out <= 1'b0;
			alu_out <= alu_out;
		end	
	end
end
endmodule

