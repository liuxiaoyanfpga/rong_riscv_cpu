// 参数的宏定义 

`define CPU_WIDTH_32 32
`define INST_MEM_ADDR_DEPTH_1024 1024
`define INST_MEM_ADDR_WIDTH_10 10
`define INST_NAME_40 40
`define SIM_PERIOD_20 20
`define REG_ADDR_WIDTH_5 5
//译码
`define OPCODE_WIDTH_7 7
`define RD_WIDTH_5 5
`define FUNT3_WIDTH_3 3
`define RS1_WIDTH_5 5
`define RS2_WIDTH_5 5
`define FUNT7_WIDTH_7 7

// 6种指令
`define INST_R `OPCODE_WIDTH_7'b0110_011
`define INST_I `OPCODE_WIDTH_7'b0010_011
`define INST_S `OPCODE_WIDTH_7'b0100_011
`define INST_B `OPCODE_WIDTH_7'b1100_011
`define INST_J `OPCODE_WIDTH_7'b1101_111
`define INST_U `OPCODE_WIDTH_7'b0010_111

// funct3
`define INST_ADD_SUB `FUNT3_WIDTH_3'h0
`define INST_ADDI `FUNT3_WIDTH_3'h0
`define INST_BNE `FUNT3_WIDTH_3'h1

//funct7
`define FUNCT7_00 `FUNT7_WIDTH_7'h00
`define FUNCT7_20 `FUNT7_WIDTH_7'h20


// ALU opcode
`define ALU_OP_WIDTH 4
`define ALU_AND  `ALU_OP_WIDTH'b0000
`define ALU_OR   `ALU_OP_WIDTH'b0001
`define ALU_XOR  `ALU_OP_WIDTH'b0010
`define ALU_ADD  `ALU_OP_WIDTH'b0011
`define ALU_SUB  `ALU_OP_WIDTH'b0100
`define ALU_SLL  `ALU_OP_WIDTH'b0101 // shift left logical
`define ALU_SRL  `ALU_OP_WIDTH'b0110 // shift right logical
`define ALU_SRA  `ALU_OP_WIDTH'b0111 // shift right arith 
`define ALU_SLT  `ALU_OP_WIDTH'b1000 // set less than  
`define ALU_SLTU `ALU_OP_WIDTH'b1001 // set less than (unsigned) 
`define ALU_BLT  `ALU_OP_WIDTH'b1010 // branch less than
`define ALU_BLTU `ALU_OP_WIDTH'b1011 // branch less than (unsigned)
`define ALU_JAL  `ALU_OP_WIDTH'b1100  
`define ALU_JALR `ALU_OP_WIDTH'b1101  

// alu_src_sel
`define ALU_SRC_WIDTH 2
`define ALU_SRC_REG     `ALU_SRC_WIDTH'b00 // src1 = reg1, src2 = reg2
`define ALU_SRC_IMM     `ALU_SRC_WIDTH'b01 // src1 = reg1, src2 = imm
`define ALU_SRC_FOUR_PC `ALU_SRC_WIDTH'b10 // src1 = 4,    src2 = pc
`define ALU_SRC_IMM_PC  `ALU_SRC_WIDTH'b11 // src1 = imm,  src2 = pc

// imm_gen_op
`define IMM_GEN_OP_WIDTH 3
`define IMM_GEN_I `IMM_GEN_OP_WIDTH'b000 
`define IMM_GEN_S `IMM_GEN_OP_WIDTH'b001
`define IMM_GEN_B `IMM_GEN_OP_WIDTH'b010
`define IMM_GEN_J `IMM_GEN_OP_WIDTH'b011
`define IMM_GEN_U `IMM_GEN_OP_WIDTH'b100