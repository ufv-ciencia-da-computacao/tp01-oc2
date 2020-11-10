module dataMemory(  input clk,
					input mem_read,
					input mem_write,
					input[63:0] address,
					input[31:0] write_data,
					output[31:0] read_data);

	reg [31:0] memory[0:127];

	assign read_data[7:0] = memory[address];
	assign read_data[15:8] = memory[address + 1];
	assign read_data[23:16] = memory[address + 2];
	assign read_data[31:24] = memory[address + 3];

	always @(posedge clk) begin
		if (mem_write == 1) begin
			memory[address] <= write_data[7:0];
			memory[address + 1] <= write_data[15:8];
			memory[address + 2] <= write_data[23:16];
			memory[address + 3] <= write_data[31:24];
		end
	end
endmodule
