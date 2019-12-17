SetActiveLib -work
comp -include "$dsn\src\ALU_Final.vhd" 
comp -include "$dsn\src\TestBench\alu_final_TB.vhd" 
asim +access +r TESTBENCH_FOR_alu_final 
wave 
wave -noreg A
wave -noreg B
wave -noreg s0
wave -noreg s1
wave -noreg s2
wave -noreg overflow
wave -noreg zero
wave -noreg negitive
wave -noreg Answer
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\alu_final_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_alu_final 
