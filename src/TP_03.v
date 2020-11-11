module TP_03(	input clk,
				output zero);

	wire [63:0] pc_value, new_pc_value, write_back;
	wire [31:0] instruction;
	wire [63:0] rd1, rd2, alu_result, alu_result_buff, read_data;
	wire stateIF, stateID, stateEXE, stateMEM, stateWB;
	wire branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite;
	wire enableWB;
	
	assign enableWB = stateWB & regWrite;

	aluADD aluPC(pc_value, 4, new_pc_value);
	progCounter PC(clk, stateIF, new_pc_value, pc_value);
	progMemory PM(clk, stateIF, pc_value, instruction);
	registers regs(clk, stateID, enableWB, instruction[19:15], instruction[24:20], instruction[11:7], write_back, rd1, rd2);
	aluOps alu(rd1, rd2, aluOp, zero, alu_result);
	dataMemory DM(clk, stateMEM, memRead, memWrite, alu_result_buff, rd2, read_data);
	reg64 buff(clk, stateEXE, alu_result, alu_result_buff);
	mux2x1 M1(read_data, alu_result_buff, memToReg, write_back);
	control ctrl(instruction[6:0], branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);

endmodule
