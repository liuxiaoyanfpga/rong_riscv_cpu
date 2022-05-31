//`include "define.v"
`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
//`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/testbench/define.v"
module pc_reg (
    input                          clk,
    input                          rst_n,
    input      [`CPU_WIDTH_32-1:0] next_pc,
    
    output reg                     en,
    output reg [`CPU_WIDTH_32-1:0] curr_pc
);

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) 
        en <= 1'b0;
    else
        en <= 1'b1;
    
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) 
        curr_pc <= `CPU_WIDTH_32'd0;
    else
        curr_pc <= next_pc;
    
end

endmodule