`include "E:/Quartus_Project/00_Way_To_Go/06-CPU/code/define.v"
module yi_ma (
    input          [`CPU_WIDTH_32-32'b1:0]  inst,
        
    output reg                              jump,
    output reg                              branch,

    output reg                              reg_w_en,
    output reg      [`REG_ADDR_WIDTH_5-1:0] reg1_r_addr,
    output reg      [`REG_ADDR_WIDTH_5-1:0] reg2_r_addr,
    output reg      [`REG_ADDR_WIDTH_5-1:0] reg_w_addr,

    output reg      [`IMM_GEN_OP_WIDTH-1:0] imm_gen_op, // immediate extend opcode
    output reg      [`ALU_OP_WIDTH-1:0]     alu_op,     // alu opcode
    output reg      [`ALU_SRC_WIDTH-1:0]    alu_src_sel // alu source select flag
            
);

wire [`OPCODE_WIDTH_7-1:0] opcode  = inst[`OPCODE_WIDTH_7-1:0];
wire [`RD_WIDTH_5-1:0]     rd      = inst[`RD_WIDTH_5+7-1:7];
wire [`FUNT3_WIDTH_3-1:0]  funct3  = inst[`FUNT3_WIDTH_3+12-1:12];
wire [`RS1_WIDTH_5-1:0]    rs1     = inst[`RS1_WIDTH_5+15-1:15];
wire [`RS2_WIDTH_5-1:0]    rs2     = inst[`RS2_WIDTH_5+20-1:20];
wire [`FUNT7_WIDTH_7-1:0]  funct7  = inst[`FUNT7_WIDTH_7+25-1:25];

//1.opcode分类型
//2.funct3+funct7分该类型下的不同指令
always @(*) begin
    branch      = 1'b0;
    jump        = 1'b0;
    reg_w_en     = 1'b0;
    reg1_r_addr  = `REG_ADDR_WIDTH_5'h0;
    reg2_r_addr  = `REG_ADDR_WIDTH_5'h0;
    reg_w_addr   = `REG_ADDR_WIDTH_5'h0;
    imm_gen_op  = `IMM_GEN_I;
    alu_op      = `ALU_AND;
    alu_src_sel = `ALU_SRC_REG;
    case (opcode)
        `INST_R:begin
            reg_w_en = 1'b1;
            reg1_r_addr = rs1;
            reg2_r_addr = rs2;
            reg_w_addr = rd;
            alu_src_sel = `ALU_SRC_REG;
            case(funct3)
                `INST_ADD_SUB:
                    alu_op = (funct7 == `FUNCT7_00)?`ALU_ADD:`ALU_SUB;
            endcase
        end
        `INST_I:begin
            reg_w_en = 1'b1;
            reg1_r_addr = rs1;
            reg_w_addr = rd;
            alu_src_sel = `ALU_SRC_IMM;
            imm_gen_op = `IMM_GEN_I;
            case(funct3)
                `INST_ADDI:
                    alu_op = `ALU_ADD;
            endcase
        end 
        `INST_B:begin
            reg_w_en = 1'b0; 
            reg1_r_addr = rs1;
            reg2_r_addr = rs2;
            alu_src_sel = `ALU_SRC_REG;
            imm_gen_op = `IMM_GEN_B; 
            case(funct3)
                `INST_BNE:begin
                    alu_op = `ALU_SUB;//用减法去判断rs1和rs2是否相等
                    branch = 1'b1;    //分支跳转标志拉高
                end
            endcase
        end
        `INST_J:begin
            jump = 1'b1;
            reg_w_en = 1'b1; 
            reg_w_addr = rd;
            alu_src_sel = `ALU_SRC_FOUR_PC;
            imm_gen_op = `IMM_GEN_J;
            alu_op = `ALU_ADD  ;
        end
        `INST_U:begin
            reg_w_en = 1'b1; 
            reg1_r_addr = `RS1_WIDTH_5'b0;                
            reg_w_addr = rd;
            alu_src_sel = `ALU_SRC_IMM;
            imm_gen_op = `IMM_GEN_U;
            alu_op = `ALU_ADD  ;  
        end              
    endcase
end 
endmodule

