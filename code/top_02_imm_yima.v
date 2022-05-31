`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
module top_02_imm_yima (
    input                          clk,
    input                          rst_n,
    input                          zero,
    //input       [`INST_NAME_40-1:0] inst_name,

    output    [`ALU_OP_WIDTH-1:0]     alu_op,    
    output    [`ALU_SRC_WIDTH-1:0]    alu_src_sel,
    output                               reg_w_en,
    output       [`REG_ADDR_WIDTH_5-1:0]  reg1_r_addr,
    output       [`REG_ADDR_WIDTH_5-1:0]  reg2_r_addr,
    output       [`REG_ADDR_WIDTH_5-1:0]  reg_w_addr,
    output       [`CPU_WIDTH_32-1:0]      imm
);

//wire [`CPU_WIDTH_32-1:0] imm;
wire [`CPU_WIDTH_32-1:0] inst; 
wire [`IMM_GEN_OP_WIDTH-1:0] imm_gen_op;
wire jump;
wire branch;

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

top_01_pc_reg top_01_pc_reg_inst(
    .clk(clk),
    .rst_n(rst_n),
    .branch(branch),
    .zero(zero),
    .jump(jump),
    .imm(imm),
    //.inst_name(inst_name),

    .inst(inst)                
);

endmodule