module branchPrediction (
    input clock,
    input isBranch,
    input lastBranchTaken,

    output reg prediction
);

    reg [1:0] state;

    initial begin
        state = 2'b00;
        prediction = 1'b0;
    end 

    always @(state) begin
        if(state == 2'b11) prediction = 1;
        if(state == 2'b00) prediction = 0;
    end

    always @(posedge clock) begin
        if(isBranch) begin
            state[1] <= state[0];
            state[0] <= lastBranchTaken;
        end
    end

endmodule