module progCounter(	input clock,
							input reset,
							input [63:0] next,
							output reg [63:0] value);				
	
	always@(posedge clock) begin
		if(reset) value <= 0;
		else value <= next;
	end
							
endmodule
