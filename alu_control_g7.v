`include "riscv_defines_g7.v"

module alu_control_g7 (
    input  wire [1:0] ALUOp,
    input  wire [6:0] funct7,
    input  wire [2:0] funct3,
    output reg  [3:0] ALUControl
);
    always @(*) begin
        case (ALUOp)
            2'b00: ALUControl = `ALU_ADD; // Para ADDI, LB, SB
            2'b01: ALUControl = `ALU_SUB; // Para BEQ
            2'b10: begin // Para instruções Tipo-R
                case (funct3)
                    3'b000: ALUControl = `ALU_ADD;
                    3'b110: ALUControl = `ALU_OR;
                    3'b111: ALUControl = `ALU_AND;
                    3'b101: ALUControl = `ALU_SRL;
                    default: ALUControl = 4'bxxxx;
                endcase
            end
            default: ALUControl = 4'bxxxx;
        endcase
    end
endmodule
