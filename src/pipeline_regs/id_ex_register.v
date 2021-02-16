module id_ex_register (
    input clk,
    input [63:0] pc,
    input [63:0] rd1, 
    input [63:0] rd2,
    input [31:0] wr,
    input [63:0] imm_gen,

    output reg [63:0] pc_reg,
    output reg [63:0] rd1_reg, 
    output reg [63:0] rd2_reg,
    output reg [31:0] wr_reg,
    output reg [63:0] imm_gen_reg
);

    always @(posedge clk) begin
        pc_reg <= pc;
        rd1_reg <= rd1;
        rd2_reg <= rd2;
        wr_reg <= wr;
        imm_gen_reg <= imm_gen;
    end
    
endmodule