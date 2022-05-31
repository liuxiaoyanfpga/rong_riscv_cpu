`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
module top (
    input clk,
    input rst_n
);

wire  [`CPU_WIDTH_32-1:0]    curr_pc;
wire  [`CPU_WIDTH_32-1:0]    inst   ;
wire  [`CPU_WIDTH_32-1:0]    next_pc;
wire  [`CPU_WIDTH_32-1:0]    imm;
wire  [`REG_ADDR_WIDTH_5-1:0] reg1_r_addr;
wire  [`REG_ADDR_WIDTH_5-1:0] reg2_r_addr;
wire  [`REG_ADDR_WIDTH_5-1:0] reg_w_addr;
wire  [`IMM_GEN_OP_WIDTH-1:0] imm_gen_op;
wire  [`ALU_OP_WIDTH-1:0]     alu_op;   
wire  [`ALU_SRC_WIDTH-1:0]    alu_src_sel;
wire  [`CPU_WIDTH_32-1:0]      reg1_r_dat;
wire  [`CPU_WIDTH_32-1:0]      reg2_r_dat;
wire  [`CPU_WIDTH_32-1:0]      alu_src1;
wire  [`CPU_WIDTH_32-1:0]      alu_src2;

wire  [`CPU_WIDTH_32-1:0]      reg_w_data;
wire  [`CPU_WIDTH_32-1:0]      reg1_r_data;
wire  [`CPU_WIDTH_32-1:0]      reg2_r_data;
inst_rom  inst_rom_inst(
 .curr_pc(curr_pc),
 .inst(inst)
);

pc_reg pc_reg_inst(
    .clk(clk),
    .rst_n(rst_n),
    .next_pc(next_pc),
 
    .en(en),
    .curr_pc(curr_pc)
);

mux_pc mux_pc_inst(
    .en(en),
    .branch(branch),
    .zero(zero),
    .jump(jump),
    .imm(imm),
    .curr_pc(curr_pc),
    
    .next_pc(next_pc)
);

yi_ma yi_ma_inst(
    .inst(inst),
    
    .jump(jump),
    .branch(branch),

    .reg_w_en(reg_w_en),
    .reg1_r_addr(reg1_r_addr),
    .reg2_r_addr(reg2_r_addr),
    .reg_w_addr(reg_w_addr),

    .imm_gen_op(imm_gen_op), // immediate extend opcode
    .alu_op(alu_op),     // alu opcode
    .alu_src_sel(alu_src_sel) // alu source select flag
            
);


imm_bring imm_bring_inst(
    .imm_gen_op(imm_gen_op) ,
    .inst(inst)             ,
    .imm(imm)
);

reg_32_32  reg_32_32_inst(
    .clk(clk),
    .rst_n(rst_n),
    .reg_w_en(reg_w_en),
    .reg1_r_addr(reg1_r_addr),
    .reg2_r_addr(reg2_r_addr),
    .reg_w_addr(reg_w_addr),
    .reg_w_data(reg_w_data),

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