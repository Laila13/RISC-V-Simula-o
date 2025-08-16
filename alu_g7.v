`include "riscv_defines_g7.v"

module alu_g7 (
    input  wire [31:0] a, b,
    input  wire [3:0]  ALUControl,
    output reg  [31:0] result,
    output wire        zero
);
    always @(*) begin
        case (ALUControl)
            `ALU_ADD: result = a + b;
            `ALU_SUB: result = a - b;
            `ALU_AND: result = a & b;
            `ALU_OR:  result = a | b;
            `ALU_SRL: result = a >> b[4:0];
            default: result = 32'hxxxxxxxx;
        endcase
    end
    assign zero = (result == 32'b0);
endmodule
