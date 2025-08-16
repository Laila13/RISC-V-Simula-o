`timescale 1ns/1ps
module testbench_g7;
    reg clk, rst;
    riscv_processor_g7 dut (.clk(clk), .rst(rst));
    initial begin clk=0; forever #5 clk=~clk; end
    initial begin
        $dumpfile("waveform.vcd"); $dumpvars(0, dut);
        rst=1; @(posedge clk); @(posedge clk); rst=0;
        #2000;
        dut.reg_file_unit.print_registers;
        $display("Simulação finalizada."); $finish;
    end
endmodule
