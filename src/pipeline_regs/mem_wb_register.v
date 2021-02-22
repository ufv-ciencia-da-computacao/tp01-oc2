module mem_wb_register (
    input clk,
    input [63:0] address,
    input [63:0] value,
    input [4:0] rd,
    input memToReg,
    input regWrite,

    output reg [63:0] address_reg,
    output reg [63:0] value_reg,
    output reg [4:0] rd_reg,
    output reg memToReg_reg,
    output reg regWrite_reg,
);
    
    always @(posedge clk) begin
        address_reg <= address;
        value_reg <= value;
        rd_reg <= rd;
        memToReg_reg <= memToReg;
        regWrite_reg <= regWrite;
    end
endmodule