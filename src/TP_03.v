module TP_03(	input clk,
				input enable,
				input reset,
				output zero);

	wire [63:0] pc_value, new_pc_value, pc_plus_4, pc_plus_imm, write_back, immediate, immShifted, aluRd2;
	wire [31:0] instruction;
	wire [63:0] rd1, rd2, alu_result, read_data, alu_result_buff;
	wire [3:0] aluOp;
 	wire stateIF, stateID, stateEXE, stateMEM, stateWB;
	wire branch, memRead, memToReg, memWrite, aluSrc, regWrite;
	
	assign pcSrc = zero & branch;

	aluADD aluPcPlus4(pc_value, 4, pc_plus_4);
	aluADD aluPcPlusImm(pc_value, immShifted, pc_plus_imm);
	mux2x1 pcMux(pc_plus_4, pc_plus_imm, pcSrc, new_pc_value);
	progCounter PC(clk, new_pc_value, pc_value);
	progMemory PM(pc_value, instruction);
	immGenerator ig(instruction, immediate);
	shiftLeft sl(immediate, immShifted);
	registers regs(clk, regWrite, instruction[19:15], instruction[24:20], instruction[11:7], write_back, rd1, rd2);
	mux2x1 aluMux(rd2, immediate, aluSrc, aluRd2);
	aluOps alu(rd1, aluRd2, aluOp, zero, alu_result);
	// reg64 aluBuff(clk, enAlu, alu_result, alu_result_buff);
	dataMemory DM(clk, memRead, memWrite, alu_result, rd2, read_data);
	mux2x1 wbMux(read_data, alu_result, memToReg, write_back);
	control ctrl(instruction[6:0], branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
	// rfsm RFSM(clk, enable, reset, stateIF, stateID, stateEXE, stateMEM, stateWB);
endmodule
