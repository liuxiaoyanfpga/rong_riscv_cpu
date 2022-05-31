`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"

module mux_alu (
    input  [`CPU_WIDTH_32-1:0]           reg1_r_data,
    input  [`CPU_WIDTH_32-1:0]           reg2_r_data,
    input  [`CPU_WIDTH_32-1:0]           curr_pc,
    input  [`CPU_WIDTH_32-1:0]           imm,
    input  [`ALU_SRC_WIDTH-1:0]          alu_src_sel,

    output  reg [`CPU_WIDTH_32-1:0]      alu_src1, 
    output  reg [`CPU_WIDTH_32-1:0]      alu_src2
);

always @(*) begin
    alu_src1 = reg1_r_data;
    alu_src2 = reg2_r_data;
    case (alu_src_sel)
        //`ALU_SRC_REG: 
        `ALU_SRC_IMM:
            alu_src2 = imm;
        `ALU_SRC_FOUR_PC:begin
            alu_src1 = `CPU_WIDTH_32'h4;
            alu_src2 = curr_pc;
        end
    endcase
end
    
endmodule