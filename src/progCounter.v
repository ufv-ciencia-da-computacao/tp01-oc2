module progCounter(	input clock,
							input enable,
							input [63:0] next,
							output reg [63:0] value);

	always@(posedge clock) begin
		if(enable) begin
			value <= next;
		end
	end
							
endmodule
