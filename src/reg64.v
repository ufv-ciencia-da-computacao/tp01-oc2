module reg64(	input clock,
					input enable,
					input [63:0] dataIn,
					output reg [63:0] dataOut);

	always @(posedge clock) begin
		if(enable) begin
			dataOut <= dataIn;
		end
	end
					
endmodule
