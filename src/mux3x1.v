module mux3x1 (
    input [63:0] in0,
    input [63:0] in1,
    input [63:0] in2,
    input [1:0] select,
    input [63:0] out0
);

    assign out0 = select == 0 ? in0 : select == 1 ? in1 : in2;

endmodule