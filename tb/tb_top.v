`timescale 1ns/1ns
`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
module tb_top();
    reg clk;
    reg rst_n;

    // register file
wire [`CPU_WIDTH_32-1:0] zero_x0  = top_inst. reg_32_32_inst. reg_home[0];
wire [`CPU_WIDTH_32-1:0] ra_x1    = top_inst. reg_32_32_inst. reg_home[1];
wire [`CPU_WIDTH_32-1:0] sp_x2    = top_inst. reg_32_32_inst. reg_home[2];
wire [`CPU_WIDTH_32-1:0] gp_x3    = top_inst. reg_32_32_inst. reg_home[3];
wire [`CPU_WIDTH_32-1:0] tp_x4    = top_inst. reg_32_32_inst. reg_home[4];
wire [`CPU_WIDTH_32-1:0] t0_x5    = top_inst. reg_32_32_inst. reg_home[5];
wire [`CPU_WIDTH_32-1:0] t1_x6    = top_inst. reg_32_32_inst. reg_home[6];
wire [`CPU_WIDTH_32-1:0] t2_x7    = top_inst. reg_32_32_inst. reg_home[7];
wire [`CPU_WIDTH_32-1:0] s0_fp_x8 = top_inst. reg_32_32_inst. reg_home[8];
wire [`CPU_WIDTH_32-1:0] s1_x9    = top_inst. reg_32_32_inst. reg_home[9];
wire [`CPU_WIDTH_32-1:0] a0_x10   = top_inst. reg_32_32_inst. reg_home[10];
wire [`CPU_WIDTH_32-1:0] a1_x11   = top_inst. reg_32_32_inst. reg_home[11];
wire [`CPU_WIDTH_32-1:0] a2_x12   = top_inst. reg_32_32_inst. reg_home[12];
wire [`CPU_WIDTH_32-1:0] a3_x13   = top_inst. reg_32_32_inst. reg_home[13];
wire [`CPU_WIDTH_32-1:0] a4_x14   = top_inst. reg_32_32_inst. reg_home[14];
wire [`CPU_WIDTH_32-1:0] a5_x15   = top_inst. reg_32_32_inst. reg_home[15];
wire [`CPU_WIDTH_32-1:0] a6_x16   = top_inst. reg_32_32_inst. reg_home[16];
wire [`CPU_WIDTH_32-1:0] a7_x17   = top_inst. reg_32_32_inst. reg_home[17];
wire [`CPU_WIDTH_32-1:0] s2_x18   = top_inst. reg_32_32_inst. reg_home[18];
wire [`CPU_WIDTH_32-1:0] s3_x19   = top_inst. reg_32_32_inst. reg_home[19];
wire [`CPU_WIDTH_32-1:0] s4_x20   = top_inst. reg_32_32_inst. reg_home[20];
wire [`CPU_WIDTH_32-1:0] s5_x21   = top_inst. reg_32_32_inst. reg_home[21];
wire [`CPU_WIDTH_32-1:0] s6_x22   = top_inst. reg_32_32_inst. reg_home[22];
wire [`CPU_WIDTH_32-1:0] s7_x23   = top_inst. reg_32_32_inst. reg_home[23];
wire [`CPU_WIDTH_32-1:0] s8_x24   = top_inst. reg_32_32_inst. reg_home[24];
wire [`CPU_WIDTH_32-1:0] s9_x25   = top_inst. reg_32_32_inst. reg_home[25];
wire [`CPU_WIDTH_32-1:0] s10_x26  = top_inst. reg_32_32_inst. reg_home[26];
wire [`CPU_WIDTH_32-1:0] s11_x27  = top_inst. reg_32_32_inst. reg_home[27];
wire [`CPU_WIDTH_32-1:0] t3_x28   = top_inst. reg_32_32_inst. reg_home[28];
wire [`CPU_WIDTH_32-1:0] t4_x29   = top_inst. reg_32_32_inst. reg_home[29];
wire [`CPU_WIDTH_32-1:0] t5_x30   = top_inst. reg_32_32_inst. reg_home[30];
wire [`CPU_WIDTH_32-1:0] t6_x31   = top_inst. reg_32_32_inst. reg_home[31];

// integer r;
// initial begin
//     wait(s10_x26 == 32'b1)   // wait sim end, when x26 == 1
//         #(`SIM_PERIOD_20 * 1 + 1)
//         if (s11_x27 == 32'b1) begin
//             $display("~~~~~~~~~~~~~~~~~~~ %s PASS ~~~~~~~~~~~~~~~~~~~",inst_name);
//             #(`SIM_PERIOD_20 * 1);
//         end 
//         else begin
//             $display("~~~~~~~~~~~~~~~~~~~ %s FAIL ~~~~~~~~~~~~~~~~~~~~",inst_name);
//             $display("fail testnum = %2d", gp_x3);
//             #(`SIM_PERIOD_20 * 1);
//             $stop;
//             for (r = 0; r < 32; r = r + 1)
//                 $display("x%2d = 0x%x", r, top_inst. reg_32_32_inst. reg_home[r]);
//         end
// end

initial begin
    clk = 1'b0;
    rst_n = 1'b1;

    $readmemh("E:/Quartus_Project/00_Way_To_Go/06-CPU/testbench/add", top_inst.inst_rom_inst.inst_rom_home);
    #(`SIM_PERIOD_20)
    rst_n = 1'b0;
    #(`SIM_PERIOD_20)
    rst_n = 1'b1;


end
always #(`SIM_PERIOD_20/2) clk = ~clk;

top top_inst(
    .clk(clk),
    .rst_n(rst_n)
);
endmodule