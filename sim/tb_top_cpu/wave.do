onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group rom /tb_top_cpu/tob_cpu/rom_inst/clk
add wave -noupdate -expand -group rom /tb_top_cpu/tob_cpu/rom_inst/rst
add wave -noupdate -expand -group rom -color Magenta /tb_top_cpu/tob_cpu/rom_inst/addr
add wave -noupdate -expand -group rom -color Magenta /tb_top_cpu/tob_cpu/rom_inst/ready
add wave -noupdate -expand -group rom -color Magenta /tb_top_cpu/tob_cpu/rom_inst/dout
add wave -noupdate -expand -group rom -color Magenta /tb_top_cpu/tob_cpu/rom_inst/en_out
add wave -noupdate -expand -group rom /tb_top_cpu/tob_cpu/rom_inst/result
add wave -noupdate -expand -group rom /tb_top_cpu/tob_cpu/rom_inst/valid
add wave -noupdate -expand -group rom /tb_top_cpu/tob_cpu/rom_inst/result_reg
add wave -noupdate -expand -group pc /tb_top_cpu/tob_cpu/cpu_inst/data_path_inst/pc_inst/clk
add wave -noupdate -expand -group pc /tb_top_cpu/tob_cpu/cpu_inst/data_path_inst/pc_inst/rst
add wave -noupdate -expand -group pc /tb_top_cpu/tob_cpu/cpu_inst/data_path_inst/pc_inst/en_in
add wave -noupdate -expand -group pc /tb_top_cpu/tob_cpu/cpu_inst/data_path_inst/pc_inst/pc_ctrl
add wave -noupdate -expand -group pc /tb_top_cpu/tob_cpu/cpu_inst/data_path_inst/pc_inst/offset_addr
add wave -noupdate -expand -group pc /tb_top_cpu/tob_cpu/cpu_inst/data_path_inst/pc_inst/pc_out
add wave -noupdate -label R3 {/tb_top_cpu/tob_cpu/cpu_inst/data_path_inst/reg_group_inst/regfile_block[3]/register_inst/q}
add wave -noupdate -label R2 {/tb_top_cpu/tob_cpu/cpu_inst/data_path_inst/reg_group_inst/regfile_block[2]/register_inst/q}
add wave -noupdate -label R1 {/tb_top_cpu/tob_cpu/cpu_inst/data_path_inst/reg_group_inst/regfile_block[1]/register_inst/q}
add wave -noupdate -label R0 {/tb_top_cpu/tob_cpu/cpu_inst/data_path_inst/reg_group_inst/regfile_block[0]/register_inst/q}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {599556 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1670191 ps}
