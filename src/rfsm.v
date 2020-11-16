module rfsm(input clk,
	 		input enable,
			input reset,
			output reg stateIF,
			output reg stateID,
			output reg stateEXE,
			output reg stateMEM,
			output reg stateWB);

	localparam[4:0] S_RESET = 5'b00000,
		            S_IF 		= 5'b10000,
		            S_ID 		= 5'b01000,
		            S_EXE 	= 5'b00100,
		            S_MEM 	= 5'b00010,
		            S_WB 		= 5'b00001;

	reg[4:0] state, next_state;

	always @(posedge clk) begin
    	if(enable) state <= next_state;
  	end

	always @ (state or reset) begin
    	if(reset) next_state <= S_RESET;
		else begin
			case(state)
				S_RESET:
					next_state <= S_IF;
				S_IF:
					next_state <= S_ID;
				S_ID:
					next_state <= S_EXE;
				S_EXE:
					next_state <= S_MEM;
				S_MEM:
					next_state <= S_WB;
				S_WB:
					next_state <= S_ID;
				default:
					next_state <= S_RESET;
			endcase
		end
	end

	always @ (state) begin
		case(state)
			S_IF:
				begin
					stateIF = 1;
					stateID = 0;
					stateEXE = 0;
					stateMEM = 0;
					stateWB = 0;
				end
			S_ID:
				begin
					stateIF = 0;
					stateID = 1;
					stateEXE = 0;
					stateMEM = 0;
					stateWB = 0;
				end
			S_EXE:
				begin
					stateIF = 0;
					stateID = 0;
					stateEXE = 1;
					stateMEM = 0;
					stateWB = 0;
				end
			S_MEM:
				begin
					stateIF = 0;
					stateID = 0;
					stateEXE = 0;
					stateMEM = 1;
					stateWB = 0;
				end
			S_WB:
				begin
					stateIF = 0;
					stateID = 0;
					stateEXE = 0;
					stateMEM = 0;
					stateWB = 1;
				end
			default:
				begin
					stateIF = 0;
					stateID = 0;
					stateEXE = 0;
					stateMEM = 0;
					stateWB = 0;
				end
		endcase
	end

endmodule
