`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"

module reg_32_32 (
    input                               clk,
    input                               rst_n,
    input                               reg_w_en,
    input      [`REG_ADDR_WIDTH_5-1:0]  reg1_r_addr,
    input      [`REG_ADDR_WIDTH_5-1:0]  reg2_r_addr,
    input      [`REG_ADDR_WIDTH_5-1:0]  reg_w_addr,
    input      [`CPU_WIDTH_32-1:0]      reg_w_data,

    output reg [`CPU_WIDTH_32-1:0]      reg1_r_data,
    output reg [`CPU_WIDTH_32-1:0]      reg2_r_data

);

//定义一个寄存器堆，用来存放外部写入的数据
reg [`CPU_WIDTH_32-1:0] reg_home [`CPU_WIDTH_32-1:0];

// 时序逻辑：写数据
// 条件满足，就将外部输入的数据写到reg_home中对应的写地址上
integer   i;
always @(posedge clk or negedge rst_n) begin
    if(~rst_n)begin   
    for (i=0; i<=`CPU_WIDTH_32-1; i=i+1) begin
        reg_home[i] <= `CPU_WIDTH_32'h0 ;
    end
    end
    else if(reg_w_en && (reg_w_addr)!=`REG_ADDR_WIDTH_5'h0)
        reg_home[reg_w_addr] <= reg_w_data;
end

// 组合逻辑：读数据
// 如果读地址=0，那么读到的数据就是32个0，如果读地址不=0，那么就去reg_home中用读地址读取数据
always @(*) begin
    if(reg1_r_addr == `REG_ADDR_WIDTH_5'h0)
        reg1_r_data = `CPU_WIDTH_32'h0;
    else 
        reg1_r_data = reg_home[reg1_r_addr];
end 

always @(*) begin
    if(reg2_r_addr == `REG_ADDR_WIDTH_5'h0)
        reg2_r_data = `CPU_WIDTH_32'h0;
    else 
        reg2_r_data = reg_home[reg2_r_addr];
end 
endmodule