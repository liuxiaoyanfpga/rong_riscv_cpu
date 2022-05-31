// `include "define.v"
//`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/testbench/define.v"
// `define CPU_WIDTH_32 32
// `define INST_MEM_ADDR_DEPTH_1024 1024
// `define INST_MEM_ADDR_WIDTH_10 10
// `define INST_NAME_40 40
// `define  SIM_PERIOD_20 20
`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
module mux_pc (
    input                          en,
    input                          branch,
    input                          zero,
    input                          jump,
    input      [`CPU_WIDTH_32-1:0] imm,
    input      [`CPU_WIDTH_32-1:0] curr_pc,
    
    output   reg  [`CPU_WIDTH_32-1:0] next_pc
);

always @(*) begin
    if (~en) 
        next_pc = curr_pc;
    else if(branch & ~zero)
        next_pc = curr_pc + imm;
    else if(jump)
        next_pc = curr_pc + imm;
    else
        next_pc = curr_pc + `CPU_WIDTH_32'h4;
    
end
endmodule


// module mux_pc (
//     input                          ena,
//     input                          branch,  // branch type 
//     input                          zero,    // alu result is zero
//     input                          jump,    // jump type 
//     input      [`CPU_WIDTH-1:0]    imm,     // immediate  
//     input      [`CPU_WIDTH-1:0]    curr_pc, // current pc addr
//     output reg [`CPU_WIDTH-1:0]    next_pc  // next pc addr
//     );

// always @(*) begin
//     if (~ena) 
//         next_pc = curr_pc;
//     else if (branch && ~zero) // bne
//         next_pc = curr_pc + imm;
//     else if (jump) // jal 
//         next_pc = curr_pc + imm;
//     else 
//         next_pc = curr_pc + `CPU_WIDTH'h4;   
// end
// endmodule