module progMemory(input [63:0] address, 
						output [31:0] value);

	reg [7:0] memory [255:0];
	
	assign value[7:0] = memory[address];
	assign value[15:8] = memory[address+1];
	assign value[23:16] = memory[address+2];
	assign value[31:24] = memory[address+3];
	
endmodule
