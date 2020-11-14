module TP_03(	input clk,
				input enable,
				input reset,
				output zero);

	wire [63:0] pc_value, new_pc_value, write_back;
	wire [31:0] instruction;
	wire [63:0] rd1, rd2, alu_result, read_data;
	wire [3:0] aluOp;
 	wire stateIF, stateID, stateEXE, stateMEM, stateWB;
	wire branch, memRead, memToReg, memWrite, aluSrc, regWrite;
	wire enMemRead, enMemWrite, enRegWrite, enAlu, enPc, enProgMemory, enReg;

	assign enRegWrite = stateWB & regWrite;
	assign enMemRead = memRead & stateMEM;
	assign enMemWrite = memWrite & stateMEM;
	assign enAlu = stateEXE;
	assign enPc = stateIF;
	assign enProgMemory = stateIF;
	assign enReg = stateID;

	aluADD aluPC(pc_value, 4, new_pc_value);
	progCounter PC(clk, enPc, new_pc_value, pc_value);
	progMemory PM(clk, enProgMemory, pc_value, instruction);
	registers regs(clk, enReg, enRegWrite, instruction[19:15], instruction[24:20], instruction[11:7], write_back, rd1, rd2);
	aluOps alu(clk, enAlu, rd1, rd2, aluOp, zero, alu_result);
	dataMemory DM(clk, enMemRead, enMemWrite, alu_result, rd2, read_data);
	mux2x1 M1(read_data, alu_result, memToReg, write_back);
	control ctrl(instruction[6:0], branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
	rfsm RFSM(clk, enable, reset, stateIF, stateID, stateEXE, stateMEM, stateWB);
endmodule
