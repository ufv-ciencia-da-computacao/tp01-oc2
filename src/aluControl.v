module aluControl(	input [1: 0] ALUOp,
					input [5:0] opcode,
					output reg [3:0] ALUCtl);

	assign instruction = {ALUOp, opcode};

	always case(instruction)
		8'b00xxxxxx: ALUCtl <= 2; // ld e sd
		8'b10100000: ALUCtl <= 2; //add
		8'b10100010 : ALUCtl <= 3; //sub
		8'b10100100: ALUCtl <= 0; // and
		8'b10100101: ALUCtl <= 1; // or
		default: ALUCtl <= 15;
	endcase

endmodule
