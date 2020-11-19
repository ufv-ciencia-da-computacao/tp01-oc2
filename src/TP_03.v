`include "mux2x1.v"
`include "control.v"
`include "aluControl.v"
`include "immGenerator.v"
`include "shiftLeft.v"
`include "alu.v"
`include "clockDivider.v"
`include "progCounter.v"
`include "progMemory.v"
`include "aluADD.v"
`include "registers.v"
`include "dataMemory.v"


module TP_03(	input systemClock,
				input reset);

	wire [63:0] pc_value, new_pc_value, pc_plus_4, pc_plus_imm, write_back, immediate, immShifted, aluRd2;
	wire [31:0] instruction;
	wire [63:0] rd1, rd2, alu_result, read_data, alu_result_buff;
	wire [1:0] aluOperation;
	wire [3:0] aluCtrlOp;
	wire pcSrc;
	wire branch, memRead, memToReg, memWrite, aluSrc, regWrite;
	wire clk, zero;
	
	assign pcSrc = zero & branch;
	
	clockDivider clkDiv(systemClock, clk);
	aluADD aluPcPlus4(pc_value, 64'd4, pc_plus_4);
	aluADD aluPcPlusImm(pc_value, immShifted, pc_plus_imm);
	mux2x1 pcMux(pc_plus_4, pc_plus_imm, pcSrc, new_pc_value);
	progCounter PC(clk, reset, new_pc_value, pc_value);
	progMemory PM(pc_value, instruction);
	immGenerator ig(instruction, immediate);
	shiftLeft sl(immediate, immShifted);
	registers regs(clk, regWrite, instruction[19:15], instruction[24:20], instruction[11:7], write_back, rd1, rd2);
	mux2x1 aluMux(rd2, immediate, aluSrc, aluRd2);
	aluControl aluCtrl(aluOperation, instruction[31:25], instruction[14:12], aluCtrlOp);
	alu aluMain(rd1, aluRd2, aluCtrlOp, zero, alu_result);
	dataMemory DM(clk, memRead, memWrite, alu_result, rd2, read_data);
	mux2x1 wbMux(alu_result, read_data, memToReg, write_back);
	control ctrl(instruction[6:0], branch, memRead, memToReg, aluOperation, memWrite, aluSrc, regWrite);
endmodule
