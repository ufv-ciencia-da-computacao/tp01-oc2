module ex_mem_register (
    input clk,
    input [63:0] pc,
    input [63:0] pc_plus_imm,
    input [63:0] alu_result,
    input [31:0] wr,
    input [63:0] rd2,
    input mem_read,
    input mem_write,
    input memToReg,
    input branch,
    input reg_write,
    input zero,

    output reg [63:0] pc_reg,
    output reg [63:0] pc_plus_imm_reg,
    output reg [63:0] alu_result_reg,
    output reg [31:0] wr_reg,
    output reg [63:0] rd2_reg,
    output reg mem_read_reg,
    output reg mem_write_reg,
    output reg memToReg_reg,
    output reg branch_reg,
    output reg reg_write_reg,
    output reg zero_reg
);

    always @(posedge clk) begin
        pc_reg <= pc;
        pc_plus_imm_reg <= pc_plus_imm;
        alu_result_reg <= alu_result;
        wr_reg <= wr;
        rd2_reg <= rd2;
        mem_read_reg <= mem_read;
        mem_write_reg <= mem_write;
        memToReg_reg <= memToReg;
        branch_reg <= branch;
        reg_write_reg <= reg_write;
        zero_reg <= zero;
    end
    
endmodule