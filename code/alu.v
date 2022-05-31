`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"

module alu (
    input         [`CPU_WIDTH_32-1:0]      alu_src1, 
    input         [`CPU_WIDTH_32-1:0]      alu_src2,
    input         [`ALU_OP_WIDTH-1:0]      alu_op,

    output  reg                            zero,
    output  reg   [`CPU_WIDTH_32-1:0]      reg_w_data

);

always @(*) begin
    zero = 1'b0;
    reg_w_data = `CPU_WIDTH_32'h0;
    case (alu_op)
        `ALU_ADD: 
            reg_w_data = alu_src1 + alu_src2;
        `ALU_SUB:begin
            reg_w_data = alu_src1 - alu_src2;
            zero = (reg_w_data == `CPU_WIDTH_32'b0) ? 1'b1 : 1'b0;//当运算结果=0，说明二者相等，zero拉高，传到mux_pc后不运行lui指令
        end
    endcase
end
    
endmodule