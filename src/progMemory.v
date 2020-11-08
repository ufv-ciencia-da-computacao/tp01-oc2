module progMemory(input [63:0] address, 
						output [31:0] value);
						
	assign value = address[31:0];
	
endmodule
