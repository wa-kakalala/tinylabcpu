`timescale 1 ns / 1 ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 
// Design Name: 
// Module Name: rom
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
module rom #(
	parameter DWIDTH = 16,
	parameter AWIDTH = 16,
	parameter DEPTH  = 16
)(
	input clk,
	input rst,
	input [AWIDTH - 1 : 0] addr,
	input ready,
	output [DWIDTH - 1 : 0] dout,
	output en_out
);
	reg [DWIDTH - 1 : 0] mem[0 : DEPTH - 1];
    reg [15:0] result=0;
	reg valid;
	reg [15:0] result_reg;

	initial begin
		mem[0] = 16'b0000_0000_0000_1000; //MOV  R0 #08			
		mem[1] = 16'b0000_0100_0000_0010; //MOV  R1 #02				
		mem[2] = 16'b0010_0100_0000_0001; //ADD  R1 #01
		mem[3] = 16'b0101_0001_0000_0000; //SUB  R0 R1
		mem[4] = 16'b1001_0001_0000_0000; //OR   R0 R1
		mem[5] = 16'b0010_0000_0000_0001; //ADD  R0 #01
		mem[6] = 16'b1010_0000_0000_1000; //Jump addr = 8'd8
		mem[7] = 16'b0101_0001_0000_0000; //SUB  R0 R1, this instruction should be jumped
		mem[8] = 16'b0000_1000_1111_1111; //MOV  R2 #255, a mask with all bits being high
		mem[9] = 16'b0000_1110_0000_0000; //AND  R0 R2, R0 & 1111_1111, which means R0 remains
		mem[10] = 16'b1010_0000_0000_1001; //Jump addr = 8'd9, the CPU keeps outputing results of R0
	end

	always @(posedge clk or negedge rst) begin
		if (rst == 0) begin
			result_reg <= 16'b0000_0000_0000_0000;
		end
		else begin
			result_reg <= result;
		end
	end

	always @(*) begin
		if (rst == 0) 
		begin
			result = 16'b0000_0000_0000_0000;
			valid = 0;
		end
		else 
		begin
			if (ready) 
			begin 
				result = mem[addr];	
				valid = 1;	
			end
			else 
			begin
			 	result = result_reg;
				valid = 0;
			end
		end
	end
	
assign dout = result;
assign en_out = valid;

endmodule
