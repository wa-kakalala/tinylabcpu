`timescale 1ns / 1ps

module pc(
   input             clk         ,
   input             rst		   ,       
	input             en_in		   ,
	input      [1:0]  pc_ctrl  	,
	input      [7:0]  offset_addr ,		 
	output reg [15:0] pc_out  	    	
);

always@(posedge clk or negedge rst) begin
   if(rst == 1'b0) begin
      pc_out <= 16'b0000_0000_0000_0000;
   end else begin
      if( en_in==1 ) begin 
         case( pc_ctrl  )
         2'b01:
            pc_out <= pc_out + 1'b1;
         2'b10:
            pc_out <= {8'b0000_0000, offset_addr[7:0]};
         default:                            
            pc_out <= pc_out;
         endcase
      end else begin
         pc_out <= pc_out;
      end
   end   
end  
endmodule