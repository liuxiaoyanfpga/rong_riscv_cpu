`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"

module top_04_alu (
    input clk,
    input rst_n
);

wire zero;
wire  [`CPU_WIDTH_32-1:0]     reg_w_data;
wire  [`ALU_OP_WIDTH-1:0]     alu_op;
wire  [`ALU_SRC_WIDTH-1:0]    alu_src_sel;
wire  [`CPU_WIDTH_32-1:0]     reg1_r_data;
wire  [`CPU_WIDTH_32-1:0]     reg2_r_data;
wire  [`CPU_WIDTH_32-1:0]     alu_src1;
wire  [`CPU_WIDTH_32-1:0]     alu_src2;

// 直接声明wire和下面的端口相连吗？
wire  [`CPU_WIDTH_32-1:0]           curr_pc;
wire  [`CPU_WIDTH_32-1:0]           imm;

top_03_reg_32_32 top_03_reg_32_32_inst(
    .clk(clk),
    .rst_n(rst_n),
    .zero(zero),
    .reg_w_data(reg_w_data),

    .alu_op(alu_op),    
    .alu_src_sel(alu_src_sel),    
    .reg1_r_data(reg1_r_data),
    .reg2_r_data(reg2_r_data)
);

mux_alu mux_alu_inst(
    .reg1_r_data(reg1_r_data),
    .reg2_r_data(reg2_r_data),
    .curr_pc(curr_pc),
    .imm(imm),
    .alu_src_sel(alu_src_sel),

    .alu_src1(alu_src1), 
    .alu_src2(alu_src2)
);

alu alu_inst(
    .alu_src1(alu_src1), 
    .alu_src2(alu_src2),
    .alu_op(alu_op),

    .zero(zero),
    .reg_w_data(reg_w_data)

);



endmodule