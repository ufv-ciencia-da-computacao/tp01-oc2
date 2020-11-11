module progMemory(input clock,
						input enable,
						input [63:0] address, 
						output reg [31:0] value);

	reg [7:0] memory [255:0];
	
	always@(posedge clock) begin
		if(enable) begin
			value[7:0] <= memory[address];
			value[15:8] <= memory[address+1];
			value[23:16] <= memory[address+2];
			value[31:24] <= memory[address+3];
		end
	end
	
endmodule
