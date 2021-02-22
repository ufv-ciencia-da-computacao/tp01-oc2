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

`include "forwardingUnit.v"
`include "hazardDetectionUnit.v"
`include "mux2x1Control.v"
`include "mux3x1.v"
`include "pipeline_regs/ex_mem_register.v"
`include "pipeline_regs/id_ex_register.v"
`include "pipeline_regs/if_id_register.v"
`include "pipeline_regs/mem_wb_register.v"


module TP_03(	input systemClock,
				input reset);

	aluADD 						aluPcPlus4();
	mux2x1 						pcMux();
	progCounter 				PC();
	progMemory 					PM();
	if_id_register				if_id();

	registers 					regs();
	immGenerator 				ig();
	control 					ctrl();
	mux2x1Control				mControl();
	id_ex_register				id_ex();


	shiftLeft 					sl();
	mux3x1						mux1();
	mux3x1						mux2();
	mux2x1 						aluMux();
	aluControl 					aluCtrl();
	aluADD 						aluPcPlusImm();
	alu 						aluMain();
	ex_mem_register				ex_mem();
	

	dataMemory 					DM();
	mem_wb_register				mem_wb();
	mux2x1 						wbMux();
	

	// visão alem do alcande de tudo
	forwardingUnit  			forwarding();
	hazardDetectionUnit			hazard();
	clockDivider 				clkDiv(systemClock, clk);

endmodule
