module mem_wb_register (
    input clk,
    input [63:0] address,
    input [31:0] value,
    input [31:0] wr,

    output reg [63:0] address_reg,
    output reg [31:0] value_reg,
    output reg [31:0] wr_reg,
);
    
    always @(posedge clk) begin
        address_reg <= address;
        value_reg <= value;
        wr_reg <= wr;
    end
endmodule