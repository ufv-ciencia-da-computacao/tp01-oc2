module progCounter(	input clock,
							input [63:0] next,
							output reg [63:0] value);

	always@(posedge clock) begin
		value <= next;
	end
							
endmodule
