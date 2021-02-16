module if_id_register (
    input clk,
    input [63:0] pc,
    input [31:0] value,
    output reg [63:0] pc_reg,
    output reg [31:0] value_reg 
);
    
    always @(posedge clock) begin
        pc_reg <= pc;
        value_reg <= value;
    end
    
endmodule