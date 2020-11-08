module TP_03(	input clk, 
					input [63:0] a,
					output [31:0] b);
	
	wire [63:0] pc_to_pm;

	progCounter PC(clk, a, pc_to_pm);
	progMemory PM(pc_to_pm, b);

endmodule
