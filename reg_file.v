module reg_file (input wire clk, RegWrite, input wire [4:0] rs1_addr, rs2_addr, rd_addr, input wire [31:0] rd_data, output wire [31:0] rs1_data, rs2_data);
    reg [31:0] registers [0:31];
    integer i;
    initial for (i=0; i<32; i=i+1) registers[i] = 32'b0;
    always @(posedge clk) if (RegWrite && (rd_addr != 0)) registers[rd_addr] <= rd_data;
    assign rs1_data = (rs1_addr == 0) ? 32'b0 : registers[rs1_addr];
    assign rs2_data = (rs2_addr == 0) ? 32'b0 : registers[rs2_addr];
    task print_registers;
        begin
            $display("\n--- Estado Final dos Registradores ---");
            for (i=0; i<32; i=i+1) $display("Register[%2d]: %d", i, registers[i]);
            $display("--------------------------------------\n");
        end
    endtask
endmodule
