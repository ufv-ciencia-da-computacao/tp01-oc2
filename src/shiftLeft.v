module shiftLeft(    input [63:0] dataIn,
                        output reg [63:0] dataOut);
    integer i;

    initial begin
        dataOut[0] = 0;
        for (i = 62 ; i >= 0; i = i - 1)
            dataOut[i+1] = dataIn[i];
    end
endmodule
