module dataMemory(  input clk,
					input mem_read,
					input mem_write,
					input[63:0] address,
					input[63:0] write_data,
					output reg[63:0] read_data);

	reg [7:0] memory [511:0];


	always @(posedge clk) begin
		if(mem_read == 1) begin
			read_data[7:0] <= memory[address];
			read_data[15:8] <= memory[address + 1];
			read_data[23:16] <= memory[address + 2];
			read_data[31:24] <= memory[address + 3];
			read_data[39:32] <= memory[address + 4];
			read_data[47:40] <= memory[address + 5];
			read_data[55:48] <= memory[address + 6];
			read_data[63:56] <= memory[address + 7];
		end
		if (mem_write == 1) begin
			memory[address] <= write_data[7:0];
			memory[address + 1] <= write_data[15:8];
			memory[address + 2] <= write_data[23:16];
			memory[address + 3] <= write_data[31:24];
			memory[address + 4] <= write_data[39:32];
			memory[address + 5] <= write_data[47:40];
			memory[address + 6] <= write_data[55:48];
			memory[address + 7] <= write_data[63:56];
		end
	end
endmodule
