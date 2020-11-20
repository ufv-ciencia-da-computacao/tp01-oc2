`timescale 1ns / 100ps
`include "TP_03.v"

module testbench();

	reg clock;
	
	TP_03 riscv(clock, 1'b0);
	
	integer i;
	
	initial begin
		clock = 0;
		$dumpfile("testbench.vcd");
		$dumpvars;
		for(i=0; i<64; i=i+1) begin
			$dumpvars(2, riscv.DM.memory[i]);
		end
		#300000 $finish;
	end

  always #10 clock = ~clock;
  
endmodule
