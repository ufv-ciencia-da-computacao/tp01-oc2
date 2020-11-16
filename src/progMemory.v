module progMemory(input [63:0] address, 
						output [31:0] value);

	reg [31:0] memory [127:0];
	
	initial begin
		$readmemb("saida", memory);
	end
	
	assign value = memory[address[63:2]];
	// assign value[15:8] = memory[address+1];
	// assign value[23:16] = memory[address+2];
	// assign value[31:24] = memory[address+3];
	
endmodule
