module if_id_register (
    input clk,
    input [63:0] pc,
    input [31:0] instruction,
    input flush,
    input if_write,
    output reg [63:0] pc_reg,
    output reg [31:0] instruction_reg 
);
    
    always @(posedge clock) begin
        if (flush) begin
            instruction_reg <= 0;
        end else if(if_write) begin
            pc_reg <= pc;
            instruction_reg <= instruction;
        end
    end
    
endmodule