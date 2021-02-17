module progCounter(	input clock,
					input enable,
					input reset,
					input [63:0] next,
					output reg [63:0] value);				
	
	initial begin
		value = 0;
	end
	
	always@(posedge clock) begin
		if(reset) value <= 0;
		else if(enable) value <= next;
	end
							
endmodule
