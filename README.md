# adder\
iverilog -o bitadder adder_seq.v bitaddertb.v full_adder.v half_adder.v\
vvp bitadder\
