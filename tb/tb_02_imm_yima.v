`timescale 1ns/1ns
`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
module tb_02_imm_yima ();
    reg                          clk;
    reg                          rst_n;
    reg                          zero;
    reg  [`INST_NAME_40-1:0]     inst_name;

    wire  [`ALU_OP_WIDTH-1:0]     alu_op;
    wire  [`ALU_SRC_WIDTH-1:0]    alu_src_sel;
    wire  [`REG_ADDR_WIDTH_5-1:0]  reg1_r_addr;
    wire  [`REG_ADDR_WIDTH_5-1:0]  reg2_r_addr;
    wire  [`REG_ADDR_WIDTH_5-1:0]  reg_w_addr;
    wire                          reg_w_en;
initial begin
    clk = 1'b0;
    rst_n = 1'b0;

    zero = 1'b1;

    $readmemh("E:/Quartus_Project/00_Way_To_Go/06-CPU/testbench/add", top_02_imm_yima_inst.top_01_pc_reg_inst.inst_rom_inst.inst_rom_home);
    #(`SIM_PERIOD_20 * 5);
    rst_n = 1'b1;

    #(`SIM_PERIOD_20 * 50);
    zero = 1'b0;
    #(`SIM_PERIOD_20 * 5);
    zero = 1'b1;

    $stop;
end

always #(`SIM_PERIOD_20/2) clk = ~clk;

top_02_imm_yima top_02_imm_yima_inst(
    .clk(clk),
    .rst_n(rst_n),
    .zero(zero),
    .inst_name(inst_name),

    .alu_op(alu_op),    
    .alu_src_sel(alu_src_sel),
    .reg_w_en(reg_w_en),
    .reg1_r_addr(reg1_r_addr),
    .reg2_r_addr(reg2_r_addr),
    .reg_w_addr(reg_w_addr)
);
endmodule