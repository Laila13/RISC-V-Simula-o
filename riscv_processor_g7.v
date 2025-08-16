`include "riscv_defines_g7.v"
module riscv_processor_g7 (input wire clk, rst);
    wire [31:0] pc_current, pc_next, instruction, rs1_data, rs2_data, write_back_data, alu_input_b, alu_result, mem_read_data;
    reg  [31:0] immediate_extended;
    wire [6:0] opcode, funct7; wire [4:0] rd_addr, rs1_addr, rs2_addr;
    wire [2:0] funct3; wire [1:0] ALUOp; wire [3:0] ALUControl;
    wire alu_zero, PCSrc, RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch;

    assign PCSrc = Branch & alu_zero;
    assign pc_next = PCSrc ? (pc_current + immediate_extended) : (pc_current + 4);
    pc pc_reg (.clk(clk), .rst(rst), .pc_next(pc_next), .pc_current(pc_current));
    instruction_memory imem (.address(pc_current), .instruction(instruction));
    assign opcode=instruction[6:0]; assign rd_addr=instruction[11:7]; assign funct3=instruction[14:12];
    assign rs1_addr=instruction[19:15]; assign rs2_addr=instruction[24:20]; assign funct7=instruction[31:25];
    control_g7 main_control (.opcode(opcode), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .ALUOp(ALUOp));
    reg_file reg_file_unit (.clk(clk), .RegWrite(RegWrite), .rs1_addr(rs1_addr), .rs2_addr(rs2_addr), .rd_addr(rd_addr), .rd_data(write_back_data), .rs1_data(rs1_data), .rs2_data(rs2_data));
    always @(*) begin
        case (opcode)
            `I_TYPE_ADDI, `I_TYPE_LOAD: immediate_extended={{21{instruction[31]}}, instruction[30:20]};
            `S_TYPE:      immediate_extended={{21{instruction[31]}}, instruction[30:25], instruction[11:7]};
            `B_TYPE:      immediate_extended={{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
            default:      immediate_extended=32'hxxxxxxxx;
        endcase
    end
    alu_control_g7 alu_control_unit (.ALUOp(ALUOp), .funct7(funct7), .funct3(funct3), .ALUControl(ALUControl));
    assign alu_input_b = ALUSrc ? immediate_extended : rs2_data;
    alu_g7 alu_unit (.a(rs1_data), .b(alu_input_b), .ALUControl(ALUControl), .result(alu_result), .zero(alu_zero));
    data_memory_byte data_mem_unit (.clk(clk), .MemWrite(MemWrite), .MemRead(MemRead), .address(alu_result), .write_data(rs2_data), .read_data(mem_read_data));
    assign write_back_data = MemtoReg ? mem_read_data : alu_result;
endmodule
