module registers(	input clock,
						input regWrite,
						input [4:0] rs1,
						input [4:0] rs2,
						input [4:0] wr,
						input [63:0] wdata,
						output [63:0] rd1,
						output [63:0] rd2);
						
	reg [63:0] regs [0:31];
	assign rd1 = regs[rs1];
	assign rd2 = regs[rs2];
	
	always @(posedge clock) begin
		if(regWrite) begin
			regs[wr] <= wdata;
		end
	end
	
endmodule
	