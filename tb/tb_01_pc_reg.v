`timescale 1ns/1ns
`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
module tb_01_pc_reg ();
    reg                          clk;
    reg                          rst_n;
    reg                          branch;
    reg                          zero;
    reg                          jump;
    reg  [`CPU_WIDTH_32-1:0]     imm;
    reg  [`INST_NAME_40-1:0]     inst_name;

    wire [`CPU_WIDTH_32-1:0]     inst;

initial begin
    clk = 1'b0;
    rst_n = 1'b0;

    branch = 1'b1;
    zero = 1'b1;
    jump = 1'b0;
    imm = `CPU_WIDTH_32'h8;
    //inst_name = "E:/Quartus_Project/00_Way_To_Go/06-CPU/testbench/add";
    //inst_task(inst_name);//调用task，将add_inst中的数据加载到指令存储器的inst_rom_home作为经验池
    $readmemh("E:/Quartus_Project/00_Way_To_Go/06-CPU/testbench/add", top_01_pc_reg_inst.inst_rom_inst.inst_rom_home);
    #(`SIM_PERIOD_20 * 5);
    rst_n = 1'b1;

    #(`SIM_PERIOD_20 * 50);
    zero = 1'b0;
    #(`SIM_PERIOD_20 * 5);
    zero = 1'b1;

    #(`SIM_PERIOD_20 * 100);
    jump = 1'b1;
    #(`SIM_PERIOD_20 * 10);
    jump = 1'b0;
    #(`SIM_PERIOD_20 * 500);
    $stop;
end

always #(`SIM_PERIOD_20/2) clk = ~clk;


// task inst_task;
// input [`INST_NAME_40-1:0] inst_name;
// begin
//     $readmemh(inst_name, top_01_pc_reg_inst.inst_rom_inst.inst_rom_home);
// end

// endtask

top_01_pc_reg top_01_pc_reg_inst(
    .clk(clk),
    .rst_n(rst_n),
    .branch(branch),
    .zero(zero),
    .jump(jump),
    .imm(imm),
    .inst_name(inst_name),

    .inst(inst)                
);
endmodule