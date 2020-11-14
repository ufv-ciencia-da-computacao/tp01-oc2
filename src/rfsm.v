module rfsm(input clk,
	 		input enable,
			input reset,
			output reg stateIF,
			output reg stateID,
			output reg stateEXE,
			output reg stateMEM,
			output reg stateWB);

	localparam[2:0] S_RESET = 3'b000,
		            S_IF = 3'b001,
		            S_ID = 3'b010,
		            S_EXE = 3'b011,
		            S_MEM = 3'b100,
		            S_WB = 3'b101;

	reg[2:0] state, next_state;

	always @(posedge clk) begin
    	if(enable) state = next_state;
  	end

	always @ (state or reset) begin
    	if(reset) next_state = S_RESET;
		else begin
			case(state)
				S_RESET:
					next_state = S_IF;
				S_IF:
					next_state = S_ID;
				S_ID:
					next_state = S_EXE;
				S_EXE:
					next_state = S_MEM;
				S_MEM:
					next_state = S_WB;
				S_WB:
					next_state = S_ID;
				default:
					next_state = S_RESET;
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
