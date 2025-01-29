`timescale 1ns / 1ps  

module cpu(
	input         clk       ,
	input         rst       ,
	input         en_ram_out,
	input  [15:0] ins       ,

	output        en_ram_in ,
	output [15:0] addr       
);

wire         en_pc     ;
wire         en_group  ;
wire         alu_in_sel;
wire         alu_end   ;
wire  [1:0]  pc_ctrl   ;
wire  [3:0]  reg_en    ;
wire  [2:0]  alu_func  ;
wire  [15:0] ir_out    ;

data_path data_path_inst (
	.clk       (clk          ),
	.rst       (rst          ),
	.offset    (ir_out[7:0]  ),
	.en_pc     (en_pc        ),
	.pc_ctrl   (pc_ctrl      ),
	.en_in     (en_group     ),
	.reg_en    (reg_en       ),
	.rd        (ir_out[11:10]),
	.rs        (ir_out[9:8]  ),
	.alu_in_sel(alu_in_sel   ),
	.alu_func  (alu_func     ),
	.en_out    (alu_end      ),
	.pc_out    (addr         )
);	                     

control_unit control_unit_inst(
	.clk       (clk          ),
	.rst       (rst          ),
	.alu_end   (alu_end      ),
	.ins       (ins          ),
	.en_ram_in (en_ram_in    ),
	.en_ram_out(en_ram_out   ),
	.en_group  (en_group     ),
	.en_pc     (en_pc        ),
	.reg_en    (reg_en       ),
	.alu_in_sel(alu_in_sel   ),
	.alu_func  (alu_func     ),
	.pc_ctrl   (pc_ctrl      ),
	.ir_out    (ir_out       )
);	
endmodule				