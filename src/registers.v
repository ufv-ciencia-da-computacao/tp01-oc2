module registers(	input clock,
						input [4:0] rs1,
						input [4:0] rs2,
						input [4:0] wr,
						input [63:0] wdata,
						input regWrite,
						output reg [63:0] rd1,
						output reg [63:0] rd2);
						
	reg [63:0] regs [0:31];
	
	// assign rd1 = !regWrite ? regs[rs1] : 64'b0;
	// assign rd2 = !regWrite ? regs[rs2] : 64'b0;
	
	always@(negedge clock) begin
		rd1 <= regs[rs1];
		rd2 <= regs[rs2];
	end
	
	always@(posedge clock) begin
		if(regWrite) begin
			regs[wr] <= wdata;
		end
	end
	
endmodule
	