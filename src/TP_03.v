module TP_03(	input clk,
				input mem_read,
				input mem_write,
				input [3:0] op,
				input flag,
				input mem_to_reg,
				output zero);

	wire [63:0] pc_value;
	wire [63:0] new_pc_value;
	wire [63:0] write_back;
	wire [31:0] instruction;
	wire [63:0] rd1;
	wire [63:0] rd2;
	wire [63:0] alu_result;
	wire [63:0] read_data;

	aluADD aluPC(pc_value, 4, new_pc_value);
	progCounter PC(clk, new_pc_value, pc_value);
	progMemory PM(clk, pc_value, instruction);
	registers regs(clk, instruction[19:15],
						instruction[24:20],
						instruction[11:7],
						write_back,
						flag,
						rd1,
						rd2);
	aluOps alu(rd1, rd2, op, zero, alu_result);
	dataMemory DM(clk, mem_read, mem_write, 0, alu_result, read_data);
	mux2x1 M1(read_data, alu_result, mem_to_reg, write_back);

endmodule
