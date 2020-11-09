module progMemory(input [63:0] address, 
						output [31:0] value);

	reg [31:0] memory [127:0];
	
	assign value = memory[address];
	
endmodule
