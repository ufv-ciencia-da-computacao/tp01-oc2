module id_ex_register (
    input clk,
    input [63:0] wb_in,
    input [63:0] mem_in, 
    input [63:0] exe_in,
    input [63:0] rd1_in,
    input [63:0] rd2_in,
    input [4:0] if_id_rs1_in,
    input [4:0] if_id_rs2_in,
    input [4:0] if_id_rd_in,

    output reg [63:0] wb,
    output reg [63:0] mem, 
    output reg [63:0] exe,
    output reg [63:0] rd1,
    output reg [63:0] rd2,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [4:0] rd
);

    always @(posedge clk) begin
        wb <= wb_in;
        mem <= mem_in;
        exe <= exe_in;
        rd1 <= rd1_in;
        rd2 <= rd2_in;
        rs1 <= if_id_rs1_in;
        rs2 <= if_id_rs2_in;
        rd <= if_id_rd_in;
    end
    
endmodule