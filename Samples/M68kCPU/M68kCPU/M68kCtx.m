//
//  M68kCtx.m
//  M68kCPU
//
//  Created by Vincent Bénony on 04/03/2014.
//  Copyright (c) 2014 Cryptic Apps. All rights reserved.
//

#import "M68kCtx.h"
#import "M68kCPU.h"
#import <Hopper/CommonTypes.h>
#import <Hopper/CPUDefinition.h>
#import <Hopper/HPDisassembledFile.h>
#import <capstone/capstone.h>

@implementation M68kCtx {
    M68kCPU *_cpu;
    NSObject<HPDisassembledFile> *_file;
    csh _handle;
}

- (instancetype)initWithCPU:(M68kCPU *)cpu andFile:(NSObject<HPDisassembledFile> *)file {
    if (self = [super init]) {
        _cpu = cpu;
        _file = file;
        if (cs_open(CS_ARCH_M68K, CS_MODE_32, &_handle) != CS_ERR_OK) {
            return nil;
        }
        cs_option(_handle, CS_OPT_DETAIL, CS_OPT_ON);
    }
    return self;
}

- (void)dealloc {
    cs_close(&_handle);
}

- (NSObject<CPUDefinition> *)cpuDefinition {
    return _cpu;
}

- (void)initDisasmStructure:(DisasmStruct *)disasm withSyntaxIndex:(NSUInteger)syntaxIndex {
    bzero(disasm, sizeof(DisasmStruct));
}

// Analysis

- (Address)adjustCodeAddress:(Address)address {
    // Instructions are always aligned to a multiple of 2.
    return address & ~1;
}

- (uint8_t)cpuModeFromAddress:(Address)address {
    return 0;
}

- (BOOL)addressForcesACPUMode:(Address)address {
    return NO;
}

- (Address)nextAddressToTryIfInstructionFailedToDecodeAt:(Address)address forCPUMode:(uint8_t)mode {
    return ((address & ~1) + 2);
}

- (int)isNopAt:(Address)address {
    uint16_t word = [_file readUInt16AtVirtualAddress:address];
    return (word == 0x4e71) ? 2 : 0;
}

- (BOOL)hasProcedurePrologAt:(Address)address {
    // procedures usually begins with a "movem.l xxx, -(a7)" or "link" instruction
    uint16_t word = [_file readUInt16AtVirtualAddress:address];
    return (word == 0x48e7) || ((word & 0xFFF8) == 0x4e50);
}

- (NSUInteger)detectedPaddingLengthAt:(Address)address {
    NSUInteger len = 0;
    while ([_file readUInt16AtVirtualAddress:address] == 0) {
        address += 2;
        len += 2;
    }

    return len;
}

- (void)analysisBeginsAt:(Address)entryPoint {

}

- (void)analysisEnded {

}

- (void)procedureAnalysisBeginsForProcedure:(NSObject<HPProcedure> *)procedure atEntryPoint:(Address)entryPoint {

}

- (void)procedureAnalysisOfPrologForProcedure:(NSObject<HPProcedure> *)procedure atEntryPoint:(Address)entryPoint {

}

- (void)procedureAnalysisOfEpilogForProcedure:(NSObject<HPProcedure> *)procedure atEntryPoint:(Address)entryPoint {
    
}

- (void)procedureAnalysisEndedForProcedure:(NSObject<HPProcedure> *)procedure atEntryPoint:(Address)entryPoint {

}

- (void)procedureAnalysisContinuesOnBasicBlock:(NSObject<HPBasicBlock> *)basicBlock {

}

- (Address)getThunkDestinationForInstructionAt:(Address)address {
    return BAD_ADDRESS;
}

- (void)resetDisassembler {

}

- (uint8_t)estimateCPUModeAtVirtualAddress:(Address)address {
    return 0;
}

uint16_t memory_read_callback(uint32_t address, void* private) {
    M68kCtx *ctx = (__bridge M68kCtx *)private;
    return [ctx readWordAt:address];
}

- (uint16_t)readWordAt:(uint32_t)address {
    return [_file readUInt16AtVirtualAddress:address];
}

static inline uint32_t capstoneRegisterToRegIndex(m68k_reg reg) {
    RegClass idx[] = {
        (RegClass) -1,

        // D0..D7
        0, 1, 2, 3,
        4, 5, 6, 7,

        // A0..A7
        0, 1, 2, 3,
        4, 5, 6, 7,

        // FP0..FP7
        0, 1, 2, 3,
        4, 5, 6, 7,

        // PC
        8,

        // State Registers
         0,  1,  2,
         3,  4,  5,
         6,  7,  8,
         9, 10, 11,
        12, 13, 14,
        15, 16, 17,
        18, 19, 20
    };

    if ((int) reg >= 0 && (int)reg < M68K_REG_ENDING) {
        return idx[reg];
    }
    
    return (uint32_t) -1;
}

static inline RegClass capstoneRegisterToRegClass(m68k_reg reg) {
    RegClass cls[] = {
        (RegClass) -1,

        // D0..D7
        RegClass_GeneralPurposeRegister, RegClass_GeneralPurposeRegister,
        RegClass_GeneralPurposeRegister, RegClass_GeneralPurposeRegister,
        RegClass_GeneralPurposeRegister, RegClass_GeneralPurposeRegister,
        RegClass_GeneralPurposeRegister, RegClass_GeneralPurposeRegister,

        // A0..A7
        (RegClass) RegClass_AddressRegister, (RegClass) RegClass_AddressRegister,
        (RegClass) RegClass_AddressRegister, (RegClass) RegClass_AddressRegister,
        (RegClass) RegClass_AddressRegister, (RegClass) RegClass_AddressRegister,
        (RegClass) RegClass_AddressRegister, (RegClass) RegClass_AddressRegister,

        // FP0..FP7
        (RegClass) RegClass_FPRegister, (RegClass) RegClass_FPRegister,
        (RegClass) RegClass_FPRegister, (RegClass) RegClass_FPRegister,
        (RegClass) RegClass_FPRegister, (RegClass) RegClass_FPRegister,
        (RegClass) RegClass_FPRegister, (RegClass) RegClass_FPRegister,

        // PC
        RegClass_GeneralPurposeRegister,

        // State Registers
        RegClass_CPUState, RegClass_CPUState, RegClass_CPUState,
        RegClass_CPUState, RegClass_CPUState, RegClass_CPUState,
        RegClass_CPUState, RegClass_CPUState, RegClass_CPUState,
        RegClass_CPUState, RegClass_CPUState, RegClass_CPUState,
        RegClass_CPUState, RegClass_CPUState, RegClass_CPUState,
        RegClass_CPUState, RegClass_CPUState, RegClass_CPUState,
        RegClass_CPUState, RegClass_CPUState, RegClass_CPUState
    };

    if ((int)reg < M68K_REG_ENDING) {
        return cls[reg];
    }

    return (RegClass) -1;
}

- (int)disassembleSingleInstruction:(DisasmStruct *)disasm usingProcessorMode:(NSUInteger)mode {
    if (disasm->bytes == NULL) return DISASM_UNKNOWN_OPCODE;

    cs_insn *insn;
    size_t count = cs_disasm(_handle, disasm->bytes, 32, disasm->virtualAddr, 1, &insn);
    if (count == 0) return DISASM_UNKNOWN_OPCODE;

    disasm->instruction.branchType = DISASM_BRANCH_NONE;
    disasm->instruction.addressValue = 0;
    disasm->instruction.pcRegisterValue = disasm->virtualAddr + insn->size;

    int op_index;
    for (op_index=0; op_index<insn->detail->m68k.op_count; op_index++) {
        cs_m68k_op *op = insn->detail->m68k.operands + op_index;
        DisasmOperand *hop_op = disasm->operand + op_index;

        switch (op->type) {
            case M68K_OP_IMM:
                hop_op->type = DISASM_OPERAND_CONSTANT_TYPE | DISASM_OPERAND_RELATIVE;
                hop_op->immediateValue = insn->detail->m68k.operands[op_index].imm;
                break;

            case M68K_OP_REG:
                hop_op->type = DISASM_OPERAND_REGISTER_TYPE;
                hop_op->type |= DISASM_BUILD_REGISTER_CLS_MASK(capstoneRegisterToRegClass(op->reg));
                hop_op->type |= DISASM_BUILD_REGISTER_INDEX_MASK(capstoneRegisterToRegIndex(op->reg));
                hop_op->userData[DISASM_M68K_OP_USER_REGLIST] = 0;
                break;

            case M68K_OP_REG_BITS:
                hop_op->type = DISASM_OPERAND_REGISTER_TYPE;
                // D0-D7 registers
                for (int i=0; i<8; i++) {
                    if (op->register_bits & (1 << i)) {
                        m68k_reg reg = (m68k_reg) (M68K_REG_D0 + i);
                        hop_op->type |= DISASM_BUILD_REGISTER_CLS_MASK(RegClass_GeneralPurposeRegister);
                        hop_op->type |= DISASM_BUILD_REGISTER_INDEX_MASK(capstoneRegisterToRegIndex(reg));
                    }
                }

                // A0-A7 registers
                for (int i=0; i<8; i++) {
                    if (op->register_bits & (0x100 << i)) {
                        m68k_reg reg = (m68k_reg) (M68K_REG_A0 + i);
                        hop_op->type |= DISASM_BUILD_REGISTER_CLS_MASK((RegClass) RegClass_AddressRegister);
                        hop_op->type |= DISASM_BUILD_REGISTER_INDEX_MASK(capstoneRegisterToRegIndex(reg));
                    }
                }

                hop_op->userData[DISASM_M68K_OP_USER_REGLIST] = op->register_bits;

                break;

            case M68K_OP_MEM: {
                BOOL registerIndirect = NO;
                BOOL hasIndex = NO;
                BOOL hasDisp = NO;
                BOOL preDecr = NO;
                BOOL postIncr = NO;
                BOOL baseIsPC = NO;
                int size = 32;
                switch (op->address_mode) {
                    case M68K_AM_REGI_ADDR:              registerIndirect = YES; break;
                    case M68K_AM_REGI_ADDR_POST_INC:     registerIndirect = YES; postIncr = YES; break;
                    case M68K_AM_REGI_ADDR_PRE_DEC:      registerIndirect = YES; preDecr = YES; break;
                    case M68K_AM_REGI_ADDR_DISP:         registerIndirect = YES; hasDisp = YES; break;
                    case M68K_AM_AREGI_INDEX_8_BIT_DISP: registerIndirect = YES; hasIndex = YES; hasDisp = YES; break;
                    case M68K_AM_AREGI_INDEX_BASE_DISP:  registerIndirect = YES; hasIndex = YES; hasDisp = YES; break;

                    case M68K_AM_MEMI_POST_INDEX:        registerIndirect = YES; hasIndex = YES; break;
                    case M68K_AM_MEMI_PRE_INDEX:         registerIndirect = YES; hasIndex = YES; break;

                    case M68K_AM_PCI_DISP:               baseIsPC = YES; registerIndirect = YES; hasDisp = YES; break;
                    case M68K_AM_PCI_INDEX_8_BIT_DISP:   baseIsPC = YES; registerIndirect = YES; hasDisp = YES; break;
                    case M68K_AM_PCI_INDEX_BASE_DISP:    baseIsPC = YES; registerIndirect = YES; hasIndex = YES; break;

                    case M68K_AM_PC_MEMI_POST_INDEX:     baseIsPC = YES; hasIndex = YES; break;
                    case M68K_AM_PC_MEMI_PRE_INDEX:      baseIsPC = YES; hasIndex = YES; break;

                    case M68K_AM_ABSOLUTE_DATA_SHORT:    size = 16; break;
                    case M68K_AM_ABSOLUTE_DATA_LONG:     break;

                    default:
                        break;
                }

                hop_op->type = DISASM_OPERAND_MEMORY_TYPE;

                if (registerIndirect) {
                    hop_op->type |= DISASM_BUILD_REGISTER_CLS_MASK((baseIsPC ? RegClass_AddressRegister : RegClass_GeneralPurposeRegister));
                    m68k_reg base = (baseIsPC ? M68K_REG_PC : op->mem.base_reg);
                    uint64_t mask = DISASM_BUILD_REGISTER_INDEX_MASK(capstoneRegisterToRegIndex(base));
                    hop_op->type |= mask;
                    hop_op->memory.baseRegistersMask = mask;
                }

                if (hasIndex && op->mem.index_reg != M68K_REG_INVALID) {
                    RegClass idxCls = capstoneRegisterToRegClass(op->mem.index_reg);
                    uint64_t mask = DISASM_BUILD_REGISTER_INDEX_MASK(capstoneRegisterToRegIndex(op->mem.index_reg));
                    hop_op->type |= DISASM_BUILD_REGISTER_CLS_MASK(idxCls);
                    hop_op->type |= mask;
                    hop_op->memory.baseRegistersMask = mask;
                    hop_op->userData[DISASM_M68K_OP_USER_INDEX_REG_CLASS] = idxCls;

                    hop_op->memory.scale = op->mem.scale;
                }

                if (hasDisp) hop_op->memory.displacement = (int16_t) op->mem.disp;

                if (baseIsPC && hasDisp && !hasIndex) {
                    disasm->instruction.pcRegisterValue -= 2;
                    disasm->instruction.addressValue = disasm->instruction.pcRegisterValue + hop_op->memory.displacement;
                }
                
                if (!registerIndirect && !hasIndex && !baseIsPC) {
                    hop_op->immediateValue = op->imm;
                }

                if (postIncr) hop_op->userData[DISASM_M68K_OP_USER_INCREMENT] = INCR_Postincrement;
                if (preDecr) hop_op->userData[DISASM_M68K_OP_USER_INCREMENT] = INCR_Predecrement;

                hop_op->size = size;

                break;
            }

            default:
                hop_op->type = DISASM_OPERAND_OTHER;
                break;
        }

    }
    for ( ; op_index < DISASM_MAX_OPERANDS; op_index++) {
        disasm->operand[op_index].type = DISASM_OPERAND_NO_OPERAND;
    }

    strcpy(disasm->instruction.mnemonic, insn->mnemonic);

    // In this early version, only branch instructions are analyzed in order to correctly
    // construct basic blocks of procedures.
    //
    // This is the strict minimum!
    //
    // You should also fill the "operand" description for every other instruction to take
    // advantage of the various analysis of Hopper.

    if (cs_insn_group(_handle, insn, M68K_GRP_JUMP)) {
        if (insn->detail->m68k.op_count > 0) {
            int lastOperandIndex = insn->detail->m68k.op_count - 1;
            cs_m68k_op *lastOperand = &insn->detail->m68k.operands[lastOperandIndex];
            if (lastOperand->type == M68K_OP_IMM) {
                disasm->instruction.addressValue = lastOperand->imm;
                disasm->operand[lastOperandIndex].type = DISASM_OPERAND_CONSTANT_TYPE | DISASM_OPERAND_RELATIVE;
                disasm->operand[lastOperandIndex].memory.displacement = disasm->instruction.addressValue;
            }
            if (insn->detail->m68k.operands[lastOperandIndex].type == M68K_OP_MEM) {
                disasm->instruction.addressValue = lastOperand->imm;
                switch (lastOperand->address_mode) {
                    case M68K_AM_NONE: break;
                    case M68K_AM_REG_DIRECT_DATA: break;
                    case M68K_AM_REG_DIRECT_ADDR: break;
                    case M68K_AM_REGI_ADDR: break;
                    case M68K_AM_REGI_ADDR_POST_INC: break;
                    case M68K_AM_REGI_ADDR_PRE_DEC: break;
                    case M68K_AM_REGI_ADDR_DISP: break;
                    case M68K_AM_AREGI_INDEX_8_BIT_DISP: break;
                    case M68K_AM_AREGI_INDEX_BASE_DISP: break;
                    case M68K_AM_MEMI_POST_INDEX: break;
                    case M68K_AM_MEMI_PRE_INDEX: break;
                    case M68K_AM_PCI_DISP:
                        disasm->operand[lastOperandIndex].type = DISASM_OPERAND_CONSTANT_TYPE | DISASM_OPERAND_RELATIVE;
                        disasm->instruction.addressValue = disasm->virtualAddr + insn->size + lastOperand->mem.disp;
                        break;
                    case M68K_AM_PCI_INDEX_8_BIT_DISP: break;
                    case M68K_AM_PCI_INDEX_BASE_DISP: break;
                    case M68K_AM_PC_MEMI_POST_INDEX: break;
                    case M68K_AM_PC_MEMI_PRE_INDEX: break;
                    case M68K_AM_ABSOLUTE_DATA_SHORT:
                        disasm->operand[lastOperandIndex].type = DISASM_OPERAND_CONSTANT_TYPE | DISASM_OPERAND_ABSOLUTE;
                        disasm->instruction.addressValue = lastOperand->imm;
                        break;
                    case M68K_AM_ABSOLUTE_DATA_LONG:
                        disasm->operand[lastOperandIndex].type = DISASM_OPERAND_CONSTANT_TYPE | DISASM_OPERAND_ABSOLUTE;
                        disasm->instruction.addressValue = lastOperand->imm;
                        break;
                    case M68K_AM_IMMIDIATE:
                        disasm->operand[lastOperandIndex].type = DISASM_OPERAND_CONSTANT_TYPE | DISASM_OPERAND_ABSOLUTE;
                        disasm->instruction.addressValue = lastOperand->imm;
                        break;
                }
            }
            disasm->operand[lastOperandIndex].isBranchDestination = 1;
            if (disasm->instruction.addressValue) disasm->operand[lastOperandIndex].immediateValue = disasm->instruction.addressValue;
        }

        switch(insn->id) {
            case M68K_INS_JMP:
                disasm->instruction.branchType = DISASM_BRANCH_JMP;
                break;

            case M68K_INS_JSR:
            case M68K_INS_BSR:
                disasm->instruction.branchType = DISASM_BRANCH_CALL;
                break;

            case M68K_INS_DBHI:
                disasm->instruction.branchType = DISASM_BRANCH_JA;
                break;
            case M68K_INS_DBLS:
                disasm->instruction.branchType = DISASM_BRANCH_JB;
                break;
            case M68K_INS_DBCC:
                disasm->instruction.branchType = DISASM_BRANCH_JNC;
                break;
            case M68K_INS_DBCS:
                disasm->instruction.branchType = DISASM_BRANCH_JC;
                break;
            case M68K_INS_DBNE:
                disasm->instruction.branchType = DISASM_BRANCH_JNE;
                break;
            case M68K_INS_DBEQ:
                disasm->instruction.branchType = DISASM_BRANCH_JE;
                break;

            case M68K_INS_DBT:
            case M68K_INS_DBF:
            case M68K_INS_DBVC:
            case M68K_INS_DBVS:
                disasm->instruction.branchType = DISASM_BRANCH_JNE;
                break;

            case M68K_INS_DBPL:
                disasm->instruction.branchType = DISASM_BRANCH_JP;
                break;
            case M68K_INS_DBMI:
                disasm->instruction.branchType = DISASM_BRANCH_JNP;
                break;
            case M68K_INS_DBGE:
                disasm->instruction.branchType = DISASM_BRANCH_JGE;
                break;
            case M68K_INS_DBLT:
                disasm->instruction.branchType = DISASM_BRANCH_JL;
                break;
            case M68K_INS_DBGT:
                disasm->instruction.branchType = DISASM_BRANCH_JG;
                break;
            case M68K_INS_DBLE:
                disasm->instruction.branchType = DISASM_BRANCH_JLE;
                break;
            case M68K_INS_DBRA:
                disasm->instruction.branchType = DISASM_BRANCH_JNE;
                break;

            case M68K_INS_BRA:
                disasm->instruction.branchType = DISASM_BRANCH_JMP;
                break;
            case M68K_INS_BHI:
                disasm->instruction.branchType = DISASM_BRANCH_JA;
                break;
            case M68K_INS_BLS:
                disasm->instruction.branchType = DISASM_BRANCH_JB;
                break;
            case M68K_INS_BCC:
                disasm->instruction.branchType = DISASM_BRANCH_JNC;
                break;
            case M68K_INS_BCS:
                disasm->instruction.branchType = DISASM_BRANCH_JC;
                break;
            case M68K_INS_BNE:
                disasm->instruction.branchType = DISASM_BRANCH_JNE;
                break;
            case M68K_INS_BEQ:
                disasm->instruction.branchType = DISASM_BRANCH_JE;
                break;
            case M68K_INS_BVC:
                disasm->instruction.branchType = DISASM_BRANCH_JNO;
                break;
            case M68K_INS_BVS:
                disasm->instruction.branchType = DISASM_BRANCH_JO;
                break;
            case M68K_INS_BPL:
                disasm->instruction.branchType = DISASM_BRANCH_JA;
                break;
            case M68K_INS_BMI:
                disasm->instruction.branchType = DISASM_BRANCH_JB;
                break;
            case M68K_INS_BGE:
                disasm->instruction.branchType = DISASM_BRANCH_JNL;
                break;
            case M68K_INS_BLT:
                disasm->instruction.branchType = DISASM_BRANCH_JL;
                break;
            case M68K_INS_BGT:
                disasm->instruction.branchType = DISASM_BRANCH_JG;
                break;
            case M68K_INS_BLE:
                disasm->instruction.branchType = DISASM_BRANCH_JNG;
                break;
        }
    }

    if (cs_insn_group(_handle, insn, M68K_GRP_RET) || cs_insn_group(_handle, insn, M68K_GRP_IRET)) {
        disasm->instruction.branchType = DISASM_BRANCH_RET;
    }

    int len = (int) insn->size;
    cs_free(insn, count);

    return len;
}

- (BOOL)instructionHaltsExecutionFlow:(DisasmStruct *)disasm {
    return NO;
}

- (void)performBranchesAnalysis:(DisasmStruct *)disasm computingNextAddress:(Address *)next andBranches:(NSMutableArray *)branches forProcedure:(NSObject<HPProcedure> *)procedure basicBlock:(NSObject<HPBasicBlock> *)basicBlock ofSegment:(NSObject<HPSegment> *)segment calledAddresses:(NSMutableArray *)calledAddresses callsites:(NSMutableArray *)callSitesAddresses {

}

- (void)performInstructionSpecificAnalysis:(DisasmStruct *)disasm forProcedure:(NSObject<HPProcedure> *)procedure inSegment:(NSObject<HPSegment> *)segment {

}

- (void)performProcedureAnalysis:(NSObject<HPProcedure> *)procedure basicBlock:(NSObject<HPBasicBlock> *)basicBlock disasm:(DisasmStruct *)disasm {

}

- (void)updateProcedureAnalysis:(DisasmStruct *)disasm {

}

// Printing

static inline int firstBitIndex(uint64_t mask) {
    for (int i=0, j=1; i<64; i++, j<<=1) {
        if (mask & j) {
            return i;
        }
    }
    return -1;
}

static inline RegClass regClassFromType(uint64_t type) {
    return (RegClass) firstBitIndex(DISASM_GET_REGISTER_CLS_MASK(type));
}

static inline int regIndexFromType(uint64_t type) {
    return firstBitIndex(DISASM_GET_REGISTER_INDEX_MASK(type));
}

- (NSObject<HPASMLine> *)buildMnemonicString:(DisasmStruct *)disasm inFile:(NSObject<HPDisassembledFile> *)file {
    NSObject<HPHopperServices> *services = _cpu.hopperServices;
    NSObject<HPASMLine> *line = [services blankASMLine];
    NSString *mnemonic = @(disasm->instruction.mnemonic);
    if (file.userRequestedSyntaxIndex) mnemonic = [mnemonic uppercaseString];
    BOOL isJump = (disasm->instruction.branchType != DISASM_BRANCH_NONE);
    [line appendMnemonic:mnemonic isJump:isJump];
    return line;
}

- (NSObject<HPASMLine> *)buildOperandString:(DisasmStruct *)disasm forOperandIndex:(NSUInteger)operandIndex inFile:(NSObject<HPDisassembledFile> *)file raw:(BOOL)raw {
    if (operandIndex >= DISASM_MAX_OPERANDS) return nil;
    DisasmOperand *operand = disasm->operand + operandIndex;
    if (operand->type == DISASM_OPERAND_NO_OPERAND) return nil;

    // Get the format requested by the user
    ArgFormat format = [file formatForArgument:operandIndex atVirtualAddress:disasm->virtualAddr];

    NSObject<HPHopperServices> *services = _cpu.hopperServices;

    NSObject<HPASMLine> *line = [services blankASMLine];

    if (operand->type & DISASM_OPERAND_CONSTANT_TYPE) {
        if (disasm->instruction.branchType) {
            if (format == Format_Default) format = Format_Address;
        }
        else {
            [line appendRawString:@"#"];
        }
        [line append:[file formatNumber:operand->immediateValue at:disasm->virtualAddr usingFormat:format andBitSize:32]];
    }
    else if (operand->type & DISASM_OPERAND_REGISTER_TYPE) {
        if (operand->userData[DISASM_M68K_OP_USER_REGLIST] == 0) {
            // Single register
            RegClass regCls = regClassFromType(operand->type);
            int regIdx = regIndexFromType(operand->type);
            [line appendRegister:[_cpu registerIndexToString:regIdx
                                                     ofClass:regCls
                                                 withBitSize:32
                                                    position:DISASM_LOWPOSITION
                                              andSyntaxIndex:file.userRequestedSyntaxIndex]
                         ofClass:regCls
                        andIndex:regIdx];
        }
        else {
            // Register list
            BOOL first = YES;
            RegClass firstClsInRange = RegClass_Special;
            RegClass lastClsInRange = RegClass_Special;
            int firstIdxInRange = -1;
            int lastIdxInRange = -1;
            m68k_reg regs[] = {
                M68K_REG_D0, M68K_REG_D1, M68K_REG_D2, M68K_REG_D3,
                M68K_REG_D4, M68K_REG_D5, M68K_REG_D6, M68K_REG_D7,

                M68K_REG_A0, M68K_REG_A1, M68K_REG_A2, M68K_REG_A3,
                M68K_REG_A4, M68K_REG_A5, M68K_REG_A6, M68K_REG_A7
            };

            uint16_t lst = operand->userData[DISASM_M68K_OP_USER_REGLIST];
            for (int i=0; i<16; i++) {
                if (lst & (1 << i)) {
                    RegClass regCls = capstoneRegisterToRegClass(regs[i]);
                    uint32_t regIdx = capstoneRegisterToRegIndex(regs[i]);
                    if (regCls != lastClsInRange || regIdx != lastIdxInRange + 1) {
                        // This register starts a new range
                        if (lastIdxInRange >= 0 && firstIdxInRange != lastIdxInRange) {
                            [line appendRawString:@"-"];
                            [line appendRegister:[_cpu registerIndexToString:lastIdxInRange
                                                                     ofClass:lastClsInRange
                                                                 withBitSize:32
                                                                    position:DISASM_LOWPOSITION
                                                              andSyntaxIndex:file.userRequestedSyntaxIndex]];
                            first = NO;
                        }
                        if (!first) {
                            [line appendRawString:@"/"];
                        }
                        [line appendRegister:[_cpu registerIndexToString:regIdx
                                                                 ofClass:regCls
                                                             withBitSize:32
                                                                position:DISASM_LOWPOSITION
                                                          andSyntaxIndex:file.userRequestedSyntaxIndex]];
                        firstClsInRange = regCls;
                        firstIdxInRange = regIdx;
                    }
                    lastClsInRange = regCls;
                    lastIdxInRange = regIdx;
                    first = NO;
                }
            }

            if (lastIdxInRange >= 0 && firstIdxInRange != lastIdxInRange) {
                [line appendRawString:@"-"];
                [line appendRegister:[_cpu registerIndexToString:lastIdxInRange
                                                         ofClass:lastClsInRange
                                                     withBitSize:32
                                                        position:DISASM_LOWPOSITION
                                                  andSyntaxIndex:file.userRequestedSyntaxIndex]];
            }
        }
    }
    else if (operand->type & DISASM_OPERAND_MEMORY_TYPE) {
        if (operand->memory.baseRegistersMask) {
            int regIdx = firstBitIndex(operand->memory.baseRegistersMask);

            // PC Indirect with a constant
            if (operand->memory.indexRegistersMask == 0 && regIdx == 8) {
                Address ea = disasm->instruction.pcRegisterValue + operand->memory.displacement;
                if (format == Format_Default) format = Format_Address;
                [line append:[file formatNumber:ea at:disasm->virtualAddr usingFormat:format andBitSize:32]];
            }
            else {
                if (operand->userData[DISASM_M68K_OP_USER_INCREMENT] == INCR_Predecrement) {
                    [line appendRawString:@"-"];
                }

                if (operand->memory.displacement) {
                    if (format == Format_Default) {
                        format = (ArgFormat) (Format_Decimal | Format_Signed);
                    }
                    [line append:[file formatNumber:operand->memory.displacement at:disasm->virtualAddr usingFormat:format andBitSize:32]];
                }

                [line appendRawString:@"("];

                [line appendRegister:[_cpu registerIndexToString:regIdx
                                                         ofClass:(RegClass) RegClass_AddressRegister
                                                     withBitSize:32
                                                        position:DISASM_LOWPOSITION
                                                  andSyntaxIndex:file.userRequestedSyntaxIndex]
                             ofClass:(RegClass) RegClass_AddressRegister
                            andIndex:regIdx];

                if (operand->memory.indexRegistersMask) {
                    [line appendRawString:@", "];
                    RegClass regCls = operand->userData[DISASM_M68K_OP_USER_INDEX_REG_CLASS];
                    int regIdx = firstBitIndex(operand->memory.indexRegistersMask);
                    [line appendRegister:[_cpu registerIndexToString:regIdx
                                                             ofClass:regCls
                                                         withBitSize:32
                                                            position:DISASM_LOWPOSITION
                                                      andSyntaxIndex:file.userRequestedSyntaxIndex]
                                 ofClass:regCls
                                andIndex:regIdx];
                    if (operand->size == 16) {
                        [line appendRawString:@".W"];
                    }

                }

                [line appendRawString:@")"];

                if (operand->userData[DISASM_M68K_OP_USER_INCREMENT] == INCR_Postincrement) {
                    [line appendRawString:@"+"];
                }
            }
        }
        else {
            if (format == Format_Default) format = Format_Address;
            [line append:[file formatNumber:operand->immediateValue at:disasm->virtualAddr usingFormat:format andBitSize:32]];
        }
    }
    
    [line setIsOperand:operandIndex startingAtIndex:0];

    return line;
}

- (NSObject<HPASMLine> *)buildCompleteOperandString:(DisasmStruct *)disasm inFile:(NSObject<HPDisassembledFile> *)file raw:(BOOL)raw {
    NSObject<HPHopperServices> *services = _cpu.hopperServices;

    NSObject<HPASMLine> *line = [services blankASMLine];

    for (int op_index=0; op_index<=DISASM_MAX_OPERANDS; op_index++) {
        NSObject<HPASMLine> *part = [self buildOperandString:disasm forOperandIndex:op_index inFile:file raw:raw];
        if (part == nil) break;
        if (op_index) [line appendRawString:@", "];
        [line append:part];
    }

    return line;
}

// Decompiler

- (BOOL)canDecompileProcedure:(NSObject<HPProcedure> *)procedure {
    return NO;
}

- (Address)skipHeader:(NSObject<HPBasicBlock> *)basicBlock ofProcedure:(NSObject<HPProcedure> *)procedure {
    return basicBlock.from;
}

- (Address)skipFooter:(NSObject<HPBasicBlock> *)basicBlock ofProcedure:(NSObject<HPProcedure> *)procedure {
    return basicBlock.to;
}

- (ASTNode *)rawDecodeArgumentIndex:(int)argIndex
                           ofDisasm:(DisasmStruct *)disasm
                  ignoringWriteMode:(BOOL)ignoreWrite
                    usingDecompiler:(Decompiler *)decompiler {
    return nil;
}

- (ASTNode *)decompileInstructionAtAddress:(Address)a
                                    disasm:(DisasmStruct *)d
                                 addNode_p:(BOOL *)addNode_p
                           usingDecompiler:(Decompiler *)decompiler {
    return nil;
}

// Assembler

- (NSData *)assembleRawInstruction:(NSString *)instr atAddress:(Address)addr forFile:(NSObject<HPDisassembledFile> *)file withCPUMode:(uint8_t)cpuMode usingSyntaxVariant:(NSUInteger)syntax error:(NSError **)error {
    return nil;
}

- (BOOL)instructionCanBeUsedToExtractDirectMemoryReferences:(DisasmStruct *)disasmStruct {
    return YES;
}

- (BOOL)instructionOnlyLoadsAddress:(DisasmStruct *)disasmStruct {
    return strncmp(disasmStruct->instruction.mnemonic, "lea", 3) == 0;
}

- (BOOL)instructionManipulatesFloat:(DisasmStruct *)disasmStruct {
    return NO;
}

- (BOOL)instructionMayBeASwitchStatement:(DisasmStruct *)disasmStruct {
    return NO;
}

@end
