`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"

module top_03_reg_32_32 (
    input                                clk,
    input                                rst_n,
    input                                zero,
    //input        [`INST_NAME_40-1:0]     inst_name,
    input        [`CPU_WIDTH_32-1:0]     reg_w_data,

    output    [`ALU_OP_WIDTH-1:0]     alu_op,    
    output    [`ALU_SRC_WIDTH-1:0]    alu_src_sel,    
    output    [`CPU_WIDTH_32-1:0]     reg1_r_data,
    output    [`CPU_WIDTH_32-1:0]     reg2_r_data,
    output
);

wire reg_w_en;
wire [`REG_ADDR_WIDTH_5-1:0]  reg1_r_addr;
wire [`REG_ADDR_WIDTH_5-1:0]  reg2_r_addr;
wire [`REG_ADDR_WIDTH_5-1:0]  reg_w_addr;


top_02_imm_yima top_02_imm_yima_inst(
    .clk(clk),
    .rst_n(rst_n),
    .zero(zero),
    //.inst_name(inst_name),

    .alu_op(alu_op),    
    .alu_src_sel(alu_src_sel),
    .reg_w_en(reg_w_en),
    .reg1_r_addr(reg1_r_addr),
    .reg2_r_addr(reg2_r_addr),
    .reg_w_addr(reg_w_addr)
);
endmodule