module control(input [6:0] instruction,
					output branch,
					output memRead,
					output memToReg,
					output [3:0] aluOp,
					output memWrite,
					output aluSRC,
					output regWrite);

	assign branch = 0;
	assign memRead = 0;
	assign memToReg = 0;
	assign aluOp = 0;
	assign memWrite = 0;
	assign aluSRC = 0;
	assign regWrite = 0;
	
					
endmodule
