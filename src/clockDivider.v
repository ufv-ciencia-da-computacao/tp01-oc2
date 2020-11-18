module clockDivider(	input clockIn,
							output clockOut);

	reg [3:0] counter;
	
	assign clockOut = counter[3];
	
	always @(posedge clockIn) begin
		counter <= counter + 4'd1;
	end
							
endmodule
