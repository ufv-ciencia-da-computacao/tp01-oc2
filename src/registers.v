module registers(	input clock,
						input regRead,
						input regWrite,
						input [4:0] rs1,
						input [4:0] rs2,
						input [4:0] wr,
						input [63:0] wdata,
						output reg [63:0] rd1,
						output reg [63:0] rd2);
						
	reg [63:0] regs [0:31];
	
	always @(posedge clock) begin
		if(regWrite) begin
			regs[wr] <= wdata;
		end
		if(regRead) begin
			rd1 <= regs[rs1];
			rd2 <= regs[rs2];
		end
	end
	
endmodule
	