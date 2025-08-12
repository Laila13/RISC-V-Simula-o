// control_g7.v
`include "riscv_defines_g7.v"
module control_g7 (
    input  wire [6:0] opcode,
    output reg        RegWrite, output reg ALUSrc,   output reg MemtoReg,
    output reg        MemRead,  output reg MemWrite, output reg Branch,
    output reg [1:0]  ALUOp
);
    always @(*) begin
        RegWrite=0; ALUSrc=0; MemtoReg=0; MemRead=0; MemWrite=0; Branch=0; ALUOp=2'b00;
        case (opcode)
            `R_TYPE:      begin RegWrite = 1'b1; ALUOp = 2'b10; end
            `I_TYPE_LOAD: begin RegWrite = 1'b1; ALUSrc = 1'b1; MemtoReg = 1'b1; MemRead = 1'b1; ALUOp = 2'b00; end
            `S_TYPE:      begin ALUSrc = 1'b1; MemWrite = 1'b1; ALUOp = 2'b00; end
            `B_TYPE:      begin Branch = 1'b1; ALUOp = 2'b01; end
        endcase
    end
endmodule