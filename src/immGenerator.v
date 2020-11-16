module immGenerator(
             input [31:0] instruction,
             output reg [63:0] immediate);

    integer i;

	initial begin
		for (i = 0 ; i <= 63; i = i + 1) immediate[i] = 0;
	end
	
	always @ (*)
	begin
    	if(instruction[6:0] == 7'b0000011)
			immediate[11:0] = instruction[31:20];

		if(instruction[6:0]== 7'b0100011)
		begin
        	immediate[11:5] = instruction[31:25];
        	immediate[4:0] = instruction[11:7];
		end
	end
endmodule
