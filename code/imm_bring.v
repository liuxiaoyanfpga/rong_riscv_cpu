`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
module imm_bring (
    input      [`IMM_GEN_OP_WIDTH-1:0] imm_gen_op ,
    input      [`CPU_WIDTH_32-1:0]     inst       ,
    output reg [`CPU_WIDTH_32-1:0]     imm
);

always @(*) begin
    imm = `CPU_WIDTH_32'b0;
    case (imm_gen_op)
        `IMM_GEN_I:
            imm = {{20{inst[31]}},inst[31:20]};
        `IMM_GEN_S:
            imm = {{20{inst[31]}},inst[31:25],inst[11:7]};
        `IMM_GEN_B:
            //imm = {{20{inst[31]}},inst[31],inst[7],inst[30:25],inst[11:8],1'b0};
            imm = {{20{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0};
        `IMM_GEN_J:
            //imm = {{12{inst[31]}},inst[31],inst[19:12],inst[20],inst[30:21],1'b0};
            imm = {{12{inst[31]}},inst[19:12],inst[20],inst[30:21],1'b0};
        `IMM_GEN_U:
            imm = {inst[31:12],12'h0};//实现立即数左移12位，在波形图上，12个0用16进制表示，就是3个0   
    endcase
end
    
endmodule