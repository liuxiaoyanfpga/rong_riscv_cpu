 //`include "define.v"
//`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/testbench/define.v"
// `define CPU_WIDTH_32 32
// `define INST_MEM_ADDR_DEPTH_1024 1024
// `define INST_MEM_ADDR_WIDTH_10 10
// `define INST_NAME_40 40
// `define  SIM_PERIOD_20 20
`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
module top_01_pc_reg (
    input                           clk,
    input                           rst_n,
    input                           branch,
    input                           zero,
    input                           jump,
    input       [`CPU_WIDTH_32-1:0] imm,
    //input       [`INST_NAME_40-1:0] inst_name,

    output      [`CPU_WIDTH_32-1:0] inst                
);
wire [`CPU_WIDTH_32-1:0]    curr_pc;
wire [`CPU_WIDTH_32-1:0]    next_pc;
wire                        en;


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
    
endmodule