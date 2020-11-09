module TP_03(	input clk, 
					input [63:0] wdata, 
					input flag, 
					output [63:0] rd1, 
					output [63:0] rd2);
	
	wire [63:0] pc_value;
	wire [63:0] new_pc_value;
	wire [31:0] instruction;
	
	aluADD aluPC(pc_value, 4, new_pc_value);
	progCounter PC(clk, new_pc_value, pc_value);
	progMemory PM(pc_value, instruction);
	registers regs(clk,
						instruction[19:15], 
						instruction[24:20], 
						instruction[11:7], 
						wdata, 
						flag, 
						rd1,
						rd2);
	
endmodule
