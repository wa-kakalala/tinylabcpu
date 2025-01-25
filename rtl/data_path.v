`timescale 1ns / 1ps  

module data_path (
	input         clk       ,
	input         rst       ,
	input         en_pc     ,
	input [1:0]   pc_ctrl   ,
	input [7:0]   offset    ,
	input  	      en_in     ,
	input [3:0]   reg_en    ,
	input  [1:0]  rd        ,
	input  [1:0]  rs        ,
	input         alu_in_sel,
	input [2:0]   alu_func  ,
	output        en_out    ,
	output [15:0] pc_out    
);

wire en_out_group  ;
wire en_out_alu_mux;  
wire [15:0] rd_q   ;
wire [15:0] rs_q   ;
wire [15:0] alu_a  ;
wire [15:0] alu_b  ;
wire [15:0] alu_out;	

pc pc_inst (
	.clk        (clk    ),
	.rst        (rst    ),       
	.en_in      (en_pc  ),
	.pc_ctrl    (pc_ctrl),
	.offset_addr(offset ), 		 			 
	.pc_out     (pc_out )	
);

reg_group reg_group_inst (
	.clk   (clk         ),
	.rst   (rst         ),
	.en_in (en_in       ),
	.reg_en(reg_en      ),
	.d_in  (alu_out     ),
	.rd    (rd          ),
	.rs    (rs          ),
	.rd_q  (rd_q        ),
	.rs_q  (rs_q        ),
	.en_out(en_out_group)
);
			
alu_mux alu_mux_inst(             
	.clk       (clk           ),                           
	.rst       (rst           ),
	.en_in     (en_out_group  ),
	.rd_q      (rd_q          ),
	.rs_q      (rs_q          ),
	.offset    (offset        ),
	.alu_in_sel(alu_in_sel    ),
	.alu_a     (alu_a         ),				
	.alu_b     (alu_b         ),
	.en_out    (en_out_alu_mux)	
);

alu alu_inst (
	.clk     (clk           ),    
	.rst     (rst           ),
	.en_in   (en_out_alu_mux),					
	.alu_a   (alu_a         ),
	.alu_b   (alu_b         ),
	.alu_func(alu_func      ),
	.en_out  (en_out        ),
	.alu_out (alu_out       ) 
);				
				
endmodule				
				