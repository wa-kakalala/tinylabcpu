`timescale 1ns / 1ps  

module control_unit (
 	input         clk       ,
	input         rst       ,
	input         alu_end   ,
	input  [15:0] ins       ,  
	input         en_ram_out,
	output        en_ram_in ,
	output        en_group  ,
	output        en_pc     ,
	output [3:0]  reg_en    ,
	output        alu_in_sel,
	output [3:0]  alu_func  ,
	output [1:0]  pc_ctrl   ,
	output [15:0] ir_out
);

ir ir_inst (
	.clk   (clk       )	,
	.rst   (rst       ) ,
	.ins   (ins       ) ,
	.en_in (en_ram_out)	,
	.ir_out(ir_out    )
);
	
state_transition state_transition_inst(
	.clk           (clk          ) ,
	.rst           (rst          ) ,
	.alu_end       (alu_end      ) ,
	.rd            (ir_out[11:10]) ,
	.opcode        (ir_out[15:12]) ,
	.en_fetch      (en_ram_in    ) ,	
	.en_group      (en_group     ) ,
	.en_pc         (en_pc        ) ,
	.pc_ctrl       (pc_ctrl      ) ,
	.reg_en        (reg_en       ) ,
	.alu_in_sel    (alu_in_sel   ) ,
	.alu_func      (alu_func     )
);

endmodule







