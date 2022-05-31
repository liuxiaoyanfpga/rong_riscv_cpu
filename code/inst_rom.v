//`include "define.v"
//`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/testbench/define.v"
// `define CPU_WIDTH_32 32
// `define INST_MEM_ADDR_DEPTH_1024 1024
// `define INST_MEM_ADDR_WIDTH_10 10
// `define INST_NAME_40 40
// `define  SIM_PERIOD_20 20
`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
module inst_rom (
    input          [`CPU_WIDTH_32-1:0]    curr_pc, // 来自mux_pc的地址
    output  reg    [`CPU_WIDTH_32-1:0]    inst     // 给ctrl的指令
);

// 定义指令存储器：1024个32位宽的指令
reg [`CPU_WIDTH_32-1:0] inst_rom_home [0:`INST_MEM_ADDR_DEPTH_1024-1];

always @(*) begin
    inst = inst_rom_home[curr_pc[`INST_MEM_ADDR_WIDTH_10+1:2]]; //PC值是+4，因此该二进制最低位要是4的倍数：8421就要舍弃掉最低2位
end

    
endmodule