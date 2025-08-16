`include "riscv_defines_g7.v"

module control_g7 (input wire [6:0] opcode, output reg RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch, output reg [1:0] ALUOp);
    always @(*) begin
        RegWrite=0; ALUSrc=0; MemtoReg=0; MemRead=0; MemWrite=0; Branch=0; ALUOp=2'b00;
        case (opcode)
            `R_TYPE:      begin RegWrite=1; ALUOp=2'b10; end
            `I_TYPE_ADDI: begin RegWrite=1; ALUSrc=1; ALUOp=2'b00; end
            `I_TYPE_LOAD: begin RegWrite=1; ALUSrc=1; MemtoReg=1; MemRead=1; end
            `S_TYPE:      begin ALUSrc=1; MemWrite=1; end
            `B_TYPE:      begin Branch=1; ALUOp=2'b01; end
        endcase
    end
endmodule
