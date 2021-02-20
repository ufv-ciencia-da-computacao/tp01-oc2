module branch_prediction (
    input clk,
    input writeEnable,
    input branch_taken,

    output wire prediction
);
    
    // two bit state
    // state[1] = 1     => last prediction: taken
    // state[1] = 0     => last prediction: not taken
    reg [1:0] state;

    initial begin
        state = 2'b00;
    end

    assign prediction = state[1];


endmodule