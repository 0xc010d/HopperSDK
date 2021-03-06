// For Capstone Engine. AUTO-GENERATED FILE, DO NOT EDIT
package capstone;

public class Arm_const {

	// ARM shift type

	public static final int ARM_SFT_INVALID = 0;
	public static final int ARM_SFT_ASR = 1;
	public static final int ARM_SFT_LSL = 2;
	public static final int ARM_SFT_LSR = 3;
	public static final int ARM_SFT_ROR = 4;
	public static final int ARM_SFT_RRX = 5;
	public static final int ARM_SFT_ASR_REG = 6;
	public static final int ARM_SFT_LSL_REG = 7;
	public static final int ARM_SFT_LSR_REG = 8;
	public static final int ARM_SFT_ROR_REG = 9;
	public static final int ARM_SFT_RRX_REG = 10;

	// ARM condition code

	public static final int ARM_CC_INVALID = 0;
	public static final int ARM_CC_EQ = 1;
	public static final int ARM_CC_NE = 2;
	public static final int ARM_CC_HS = 3;
	public static final int ARM_CC_LO = 4;
	public static final int ARM_CC_MI = 5;
	public static final int ARM_CC_PL = 6;
	public static final int ARM_CC_VS = 7;
	public static final int ARM_CC_VC = 8;
	public static final int ARM_CC_HI = 9;
	public static final int ARM_CC_LS = 10;
	public static final int ARM_CC_GE = 11;
	public static final int ARM_CC_LT = 12;
	public static final int ARM_CC_GT = 13;
	public static final int ARM_CC_LE = 14;
	public static final int ARM_CC_AL = 15;

	// Special registers for MSR

	public static final int ARM_SYSREG_INVALID = 0;
	public static final int ARM_SYSREG_SPSR_C = 1;
	public static final int ARM_SYSREG_SPSR_X = 2;
	public static final int ARM_SYSREG_SPSR_S = 4;
	public static final int ARM_SYSREG_SPSR_F = 8;
	public static final int ARM_SYSREG_CPSR_C = 16;
	public static final int ARM_SYSREG_CPSR_X = 32;
	public static final int ARM_SYSREG_CPSR_S = 64;
	public static final int ARM_SYSREG_CPSR_F = 128;
	public static final int ARM_SYSREG_APSR = 256;
	public static final int ARM_SYSREG_APSR_G = 257;
	public static final int ARM_SYSREG_APSR_NZCVQ = 258;
	public static final int ARM_SYSREG_APSR_NZCVQG = 259;
	public static final int ARM_SYSREG_IAPSR = 260;
	public static final int ARM_SYSREG_IAPSR_G = 261;
	public static final int ARM_SYSREG_IAPSR_NZCVQG = 262;
	public static final int ARM_SYSREG_IAPSR_NZCVQ = 263;
	public static final int ARM_SYSREG_EAPSR = 264;
	public static final int ARM_SYSREG_EAPSR_G = 265;
	public static final int ARM_SYSREG_EAPSR_NZCVQG = 266;
	public static final int ARM_SYSREG_EAPSR_NZCVQ = 267;
	public static final int ARM_SYSREG_XPSR = 268;
	public static final int ARM_SYSREG_XPSR_G = 269;
	public static final int ARM_SYSREG_XPSR_NZCVQG = 270;
	public static final int ARM_SYSREG_XPSR_NZCVQ = 271;
	public static final int ARM_SYSREG_IPSR = 272;
	public static final int ARM_SYSREG_EPSR = 273;
	public static final int ARM_SYSREG_IEPSR = 274;
	public static final int ARM_SYSREG_MSP = 275;
	public static final int ARM_SYSREG_PSP = 276;
	public static final int ARM_SYSREG_PRIMASK = 277;
	public static final int ARM_SYSREG_BASEPRI = 278;
	public static final int ARM_SYSREG_BASEPRI_MAX = 279;
	public static final int ARM_SYSREG_FAULTMASK = 280;
	public static final int ARM_SYSREG_CONTROL = 281;
	public static final int ARM_SYSREG_R8_USR = 282;
	public static final int ARM_SYSREG_R9_USR = 283;
	public static final int ARM_SYSREG_R10_USR = 284;
	public static final int ARM_SYSREG_R11_USR = 285;
	public static final int ARM_SYSREG_R12_USR = 286;
	public static final int ARM_SYSREG_SP_USR = 287;
	public static final int ARM_SYSREG_LR_USR = 288;
	public static final int ARM_SYSREG_R8_FIQ = 289;
	public static final int ARM_SYSREG_R9_FIQ = 290;
	public static final int ARM_SYSREG_R10_FIQ = 291;
	public static final int ARM_SYSREG_R11_FIQ = 292;
	public static final int ARM_SYSREG_R12_FIQ = 293;
	public static final int ARM_SYSREG_SP_FIQ = 294;
	public static final int ARM_SYSREG_LR_FIQ = 295;
	public static final int ARM_SYSREG_LR_IRQ = 296;
	public static final int ARM_SYSREG_SP_IRQ = 297;
	public static final int ARM_SYSREG_LR_SVC = 298;
	public static final int ARM_SYSREG_SP_SVC = 299;
	public static final int ARM_SYSREG_LR_ABT = 300;
	public static final int ARM_SYSREG_SP_ABT = 301;
	public static final int ARM_SYSREG_LR_UND = 302;
	public static final int ARM_SYSREG_SP_UND = 303;
	public static final int ARM_SYSREG_LR_MON = 304;
	public static final int ARM_SYSREG_SP_MON = 305;
	public static final int ARM_SYSREG_ELR_HYP = 306;
	public static final int ARM_SYSREG_SP_HYP = 307;
	public static final int ARM_SYSREG_SPSR_FIQ = 308;
	public static final int ARM_SYSREG_SPSR_IRQ = 309;
	public static final int ARM_SYSREG_SPSR_SVC = 310;
	public static final int ARM_SYSREG_SPSR_ABT = 311;
	public static final int ARM_SYSREG_SPSR_UND = 312;
	public static final int ARM_SYSREG_SPSR_MON = 313;
	public static final int ARM_SYSREG_SPSR_HYP = 314;

	// The memory barrier constants map directly to the 4-bit encoding of

	// the option field for Memory Barrier operations.

	public static final int ARM_MB_INVALID = 0;
	public static final int ARM_MB_RESERVED_0 = 1;
	public static final int ARM_MB_OSHLD = 2;
	public static final int ARM_MB_OSHST = 3;
	public static final int ARM_MB_OSH = 4;
	public static final int ARM_MB_RESERVED_4 = 5;
	public static final int ARM_MB_NSHLD = 6;
	public static final int ARM_MB_NSHST = 7;
	public static final int ARM_MB_NSH = 8;
	public static final int ARM_MB_RESERVED_8 = 9;
	public static final int ARM_MB_ISHLD = 10;
	public static final int ARM_MB_ISHST = 11;
	public static final int ARM_MB_ISH = 12;
	public static final int ARM_MB_RESERVED_12 = 13;
	public static final int ARM_MB_LD = 14;
	public static final int ARM_MB_ST = 15;
	public static final int ARM_MB_SY = 16;

	// Operand type for instruction's operands

	public static final int ARM_OP_INVALID = 0;
	public static final int ARM_OP_REG = 1;
	public static final int ARM_OP_IMM = 2;
	public static final int ARM_OP_MEM = 3;
	public static final int ARM_OP_FP = 4;
	public static final int ARM_OP_CIMM = 64;
	public static final int ARM_OP_PIMM = 65;
	public static final int ARM_OP_SETEND = 66;
	public static final int ARM_OP_SYSREG = 67;

	// Operand type for SETEND instruction

	public static final int ARM_SETEND_INVALID = 0;
	public static final int ARM_SETEND_BE = 1;
	public static final int ARM_SETEND_LE = 2;

	public static final int ARM_CPSMODE_INVALID = 0;
	public static final int ARM_CPSMODE_IE = 2;
	public static final int ARM_CPSMODE_ID = 3;

	// Operand type for SETEND instruction

	public static final int ARM_CPSFLAG_INVALID = 0;
	public static final int ARM_CPSFLAG_F = 1;
	public static final int ARM_CPSFLAG_I = 2;
	public static final int ARM_CPSFLAG_A = 4;
	public static final int ARM_CPSFLAG_NONE = 16;

	// Data type for elements of vector instructions.

	public static final int ARM_VECTORDATA_INVALID = 0;
	public static final int ARM_VECTORDATA_I8 = 1;
	public static final int ARM_VECTORDATA_I16 = 2;
	public static final int ARM_VECTORDATA_I32 = 3;
	public static final int ARM_VECTORDATA_I64 = 4;
	public static final int ARM_VECTORDATA_S8 = 5;
	public static final int ARM_VECTORDATA_S16 = 6;
	public static final int ARM_VECTORDATA_S32 = 7;
	public static final int ARM_VECTORDATA_S64 = 8;
	public static final int ARM_VECTORDATA_U8 = 9;
	public static final int ARM_VECTORDATA_U16 = 10;
	public static final int ARM_VECTORDATA_U32 = 11;
	public static final int ARM_VECTORDATA_U64 = 12;
	public static final int ARM_VECTORDATA_P8 = 13;
	public static final int ARM_VECTORDATA_F32 = 14;
	public static final int ARM_VECTORDATA_F64 = 15;
	public static final int ARM_VECTORDATA_F16F64 = 16;
	public static final int ARM_VECTORDATA_F64F16 = 17;
	public static final int ARM_VECTORDATA_F32F16 = 18;
	public static final int ARM_VECTORDATA_F16F32 = 19;
	public static final int ARM_VECTORDATA_F64F32 = 20;
	public static final int ARM_VECTORDATA_F32F64 = 21;
	public static final int ARM_VECTORDATA_S32F32 = 22;
	public static final int ARM_VECTORDATA_U32F32 = 23;
	public static final int ARM_VECTORDATA_F32S32 = 24;
	public static final int ARM_VECTORDATA_F32U32 = 25;
	public static final int ARM_VECTORDATA_F64S16 = 26;
	public static final int ARM_VECTORDATA_F32S16 = 27;
	public static final int ARM_VECTORDATA_F64S32 = 28;
	public static final int ARM_VECTORDATA_S16F64 = 29;
	public static final int ARM_VECTORDATA_S16F32 = 30;
	public static final int ARM_VECTORDATA_S32F64 = 31;
	public static final int ARM_VECTORDATA_U16F64 = 32;
	public static final int ARM_VECTORDATA_U16F32 = 33;
	public static final int ARM_VECTORDATA_U32F64 = 34;
	public static final int ARM_VECTORDATA_F64U16 = 35;
	public static final int ARM_VECTORDATA_F32U16 = 36;
	public static final int ARM_VECTORDATA_F64U32 = 37;

	// ARM registers

	public static final int ARM_REG_INVALID = 0;
	public static final int ARM_REG_APSR = 1;
	public static final int ARM_REG_APSR_NZCV = 2;
	public static final int ARM_REG_CPSR = 3;
	public static final int ARM_REG_FPEXC = 4;
	public static final int ARM_REG_FPINST = 5;
	public static final int ARM_REG_FPSCR = 6;
	public static final int ARM_REG_FPSCR_NZCV = 7;
	public static final int ARM_REG_FPSID = 8;
	public static final int ARM_REG_ITSTATE = 9;
	public static final int ARM_REG_LR = 10;
	public static final int ARM_REG_PC = 11;
	public static final int ARM_REG_SP = 12;
	public static final int ARM_REG_SPSR = 13;
	public static final int ARM_REG_D0 = 14;
	public static final int ARM_REG_D1 = 15;
	public static final int ARM_REG_D2 = 16;
	public static final int ARM_REG_D3 = 17;
	public static final int ARM_REG_D4 = 18;
	public static final int ARM_REG_D5 = 19;
	public static final int ARM_REG_D6 = 20;
	public static final int ARM_REG_D7 = 21;
	public static final int ARM_REG_D8 = 22;
	public static final int ARM_REG_D9 = 23;
	public static final int ARM_REG_D10 = 24;
	public static final int ARM_REG_D11 = 25;
	public static final int ARM_REG_D12 = 26;
	public static final int ARM_REG_D13 = 27;
	public static final int ARM_REG_D14 = 28;
	public static final int ARM_REG_D15 = 29;
	public static final int ARM_REG_D16 = 30;
	public static final int ARM_REG_D17 = 31;
	public static final int ARM_REG_D18 = 32;
	public static final int ARM_REG_D19 = 33;
	public static final int ARM_REG_D20 = 34;
	public static final int ARM_REG_D21 = 35;
	public static final int ARM_REG_D22 = 36;
	public static final int ARM_REG_D23 = 37;
	public static final int ARM_REG_D24 = 38;
	public static final int ARM_REG_D25 = 39;
	public static final int ARM_REG_D26 = 40;
	public static final int ARM_REG_D27 = 41;
	public static final int ARM_REG_D28 = 42;
	public static final int ARM_REG_D29 = 43;
	public static final int ARM_REG_D30 = 44;
	public static final int ARM_REG_D31 = 45;
	public static final int ARM_REG_FPINST2 = 46;
	public static final int ARM_REG_MVFR0 = 47;
	public static final int ARM_REG_MVFR1 = 48;
	public static final int ARM_REG_MVFR2 = 49;
	public static final int ARM_REG_Q0 = 50;
	public static final int ARM_REG_Q1 = 51;
	public static final int ARM_REG_Q2 = 52;
	public static final int ARM_REG_Q3 = 53;
	public static final int ARM_REG_Q4 = 54;
	public static final int ARM_REG_Q5 = 55;
	public static final int ARM_REG_Q6 = 56;
	public static final int ARM_REG_Q7 = 57;
	public static final int ARM_REG_Q8 = 58;
	public static final int ARM_REG_Q9 = 59;
	public static final int ARM_REG_Q10 = 60;
	public static final int ARM_REG_Q11 = 61;
	public static final int ARM_REG_Q12 = 62;
	public static final int ARM_REG_Q13 = 63;
	public static final int ARM_REG_Q14 = 64;
	public static final int ARM_REG_Q15 = 65;
	public static final int ARM_REG_R0 = 66;
	public static final int ARM_REG_R1 = 67;
	public static final int ARM_REG_R2 = 68;
	public static final int ARM_REG_R3 = 69;
	public static final int ARM_REG_R4 = 70;
	public static final int ARM_REG_R5 = 71;
	public static final int ARM_REG_R6 = 72;
	public static final int ARM_REG_R7 = 73;
	public static final int ARM_REG_R8 = 74;
	public static final int ARM_REG_R9 = 75;
	public static final int ARM_REG_R10 = 76;
	public static final int ARM_REG_R11 = 77;
	public static final int ARM_REG_R12 = 78;
	public static final int ARM_REG_S0 = 79;
	public static final int ARM_REG_S1 = 80;
	public static final int ARM_REG_S2 = 81;
	public static final int ARM_REG_S3 = 82;
	public static final int ARM_REG_S4 = 83;
	public static final int ARM_REG_S5 = 84;
	public static final int ARM_REG_S6 = 85;
	public static final int ARM_REG_S7 = 86;
	public static final int ARM_REG_S8 = 87;
	public static final int ARM_REG_S9 = 88;
	public static final int ARM_REG_S10 = 89;
	public static final int ARM_REG_S11 = 90;
	public static final int ARM_REG_S12 = 91;
	public static final int ARM_REG_S13 = 92;
	public static final int ARM_REG_S14 = 93;
	public static final int ARM_REG_S15 = 94;
	public static final int ARM_REG_S16 = 95;
	public static final int ARM_REG_S17 = 96;
	public static final int ARM_REG_S18 = 97;
	public static final int ARM_REG_S19 = 98;
	public static final int ARM_REG_S20 = 99;
	public static final int ARM_REG_S21 = 100;
	public static final int ARM_REG_S22 = 101;
	public static final int ARM_REG_S23 = 102;
	public static final int ARM_REG_S24 = 103;
	public static final int ARM_REG_S25 = 104;
	public static final int ARM_REG_S26 = 105;
	public static final int ARM_REG_S27 = 106;
	public static final int ARM_REG_S28 = 107;
	public static final int ARM_REG_S29 = 108;
	public static final int ARM_REG_S30 = 109;
	public static final int ARM_REG_S31 = 110;
	public static final int ARM_REG_ENDING = 111;

	// alias registers
	public static final int ARM_REG_R13 = ARM_REG_SP;
	public static final int ARM_REG_R14 = ARM_REG_LR;
	public static final int ARM_REG_R15 = ARM_REG_PC;
	public static final int ARM_REG_SB = ARM_REG_R9;
	public static final int ARM_REG_SL = ARM_REG_R10;
	public static final int ARM_REG_FP = ARM_REG_R11;
	public static final int ARM_REG_IP = ARM_REG_R12;

	// ARM instruction

	public static final int ARM_INS_INVALID = 0;
	public static final int ARM_INS_ADC = 1;
	public static final int ARM_INS_ADD = 2;
	public static final int ARM_INS_ADR = 3;
	public static final int ARM_INS_AESD = 4;
	public static final int ARM_INS_AESE = 5;
	public static final int ARM_INS_AESIMC = 6;
	public static final int ARM_INS_AESMC = 7;
	public static final int ARM_INS_AND = 8;
	public static final int ARM_INS_BFC = 9;
	public static final int ARM_INS_BFI = 10;
	public static final int ARM_INS_BIC = 11;
	public static final int ARM_INS_BKPT = 12;
	public static final int ARM_INS_BL = 13;
	public static final int ARM_INS_BLX = 14;
	public static final int ARM_INS_BX = 15;
	public static final int ARM_INS_BXJ = 16;
	public static final int ARM_INS_B = 17;
	public static final int ARM_INS_CDP = 18;
	public static final int ARM_INS_CDP2 = 19;
	public static final int ARM_INS_CLREX = 20;
	public static final int ARM_INS_CLZ = 21;
	public static final int ARM_INS_CMN = 22;
	public static final int ARM_INS_CMP = 23;
	public static final int ARM_INS_CPS = 24;
	public static final int ARM_INS_CRC32B = 25;
	public static final int ARM_INS_CRC32CB = 26;
	public static final int ARM_INS_CRC32CH = 27;
	public static final int ARM_INS_CRC32CW = 28;
	public static final int ARM_INS_CRC32H = 29;
	public static final int ARM_INS_CRC32W = 30;
	public static final int ARM_INS_DBG = 31;
	public static final int ARM_INS_DMB = 32;
	public static final int ARM_INS_DSB = 33;
	public static final int ARM_INS_EOR = 34;
	public static final int ARM_INS_ERET = 35;
	public static final int ARM_INS_VMOV = 36;
	public static final int ARM_INS_FLDMDBX = 37;
	public static final int ARM_INS_FLDMIAX = 38;
	public static final int ARM_INS_VMRS = 39;
	public static final int ARM_INS_FSTMDBX = 40;
	public static final int ARM_INS_FSTMIAX = 41;
	public static final int ARM_INS_HINT = 42;
	public static final int ARM_INS_HLT = 43;
	public static final int ARM_INS_HVC = 44;
	public static final int ARM_INS_ISB = 45;
	public static final int ARM_INS_LDA = 46;
	public static final int ARM_INS_LDAB = 47;
	public static final int ARM_INS_LDAEX = 48;
	public static final int ARM_INS_LDAEXB = 49;
	public static final int ARM_INS_LDAEXD = 50;
	public static final int ARM_INS_LDAEXH = 51;
	public static final int ARM_INS_LDAH = 52;
	public static final int ARM_INS_LDC2L = 53;
	public static final int ARM_INS_LDC2 = 54;
	public static final int ARM_INS_LDCL = 55;
	public static final int ARM_INS_LDC = 56;
	public static final int ARM_INS_LDMDA = 57;
	public static final int ARM_INS_LDMDB = 58;
	public static final int ARM_INS_LDM = 59;
	public static final int ARM_INS_LDMIB = 60;
	public static final int ARM_INS_LDRBT = 61;
	public static final int ARM_INS_LDRB = 62;
	public static final int ARM_INS_LDRD = 63;
	public static final int ARM_INS_LDREX = 64;
	public static final int ARM_INS_LDREXB = 65;
	public static final int ARM_INS_LDREXD = 66;
	public static final int ARM_INS_LDREXH = 67;
	public static final int ARM_INS_LDRH = 68;
	public static final int ARM_INS_LDRHT = 69;
	public static final int ARM_INS_LDRSB = 70;
	public static final int ARM_INS_LDRSBT = 71;
	public static final int ARM_INS_LDRSH = 72;
	public static final int ARM_INS_LDRSHT = 73;
	public static final int ARM_INS_LDRT = 74;
	public static final int ARM_INS_LDR = 75;
	public static final int ARM_INS_MCR = 76;
	public static final int ARM_INS_MCR2 = 77;
	public static final int ARM_INS_MCRR = 78;
	public static final int ARM_INS_MCRR2 = 79;
	public static final int ARM_INS_MLA = 80;
	public static final int ARM_INS_MLS = 81;
	public static final int ARM_INS_MOV = 82;
	public static final int ARM_INS_MOVT = 83;
	public static final int ARM_INS_MOVW = 84;
	public static final int ARM_INS_MRC = 85;
	public static final int ARM_INS_MRC2 = 86;
	public static final int ARM_INS_MRRC = 87;
	public static final int ARM_INS_MRRC2 = 88;
	public static final int ARM_INS_MRS = 89;
	public static final int ARM_INS_MSR = 90;
	public static final int ARM_INS_MUL = 91;
	public static final int ARM_INS_MVN = 92;
	public static final int ARM_INS_ORR = 93;
	public static final int ARM_INS_PKHBT = 94;
	public static final int ARM_INS_PKHTB = 95;
	public static final int ARM_INS_PLDW = 96;
	public static final int ARM_INS_PLD = 97;
	public static final int ARM_INS_PLI = 98;
	public static final int ARM_INS_QADD = 99;
	public static final int ARM_INS_QADD16 = 100;
	public static final int ARM_INS_QADD8 = 101;
	public static final int ARM_INS_QASX = 102;
	public static final int ARM_INS_QDADD = 103;
	public static final int ARM_INS_QDSUB = 104;
	public static final int ARM_INS_QSAX = 105;
	public static final int ARM_INS_QSUB = 106;
	public static final int ARM_INS_QSUB16 = 107;
	public static final int ARM_INS_QSUB8 = 108;
	public static final int ARM_INS_RBIT = 109;
	public static final int ARM_INS_REV = 110;
	public static final int ARM_INS_REV16 = 111;
	public static final int ARM_INS_REVSH = 112;
	public static final int ARM_INS_RFEDA = 113;
	public static final int ARM_INS_RFEDB = 114;
	public static final int ARM_INS_RFEIA = 115;
	public static final int ARM_INS_RFEIB = 116;
	public static final int ARM_INS_RSB = 117;
	public static final int ARM_INS_RSC = 118;
	public static final int ARM_INS_SADD16 = 119;
	public static final int ARM_INS_SADD8 = 120;
	public static final int ARM_INS_SASX = 121;
	public static final int ARM_INS_SBC = 122;
	public static final int ARM_INS_SBFX = 123;
	public static final int ARM_INS_SDIV = 124;
	public static final int ARM_INS_SEL = 125;
	public static final int ARM_INS_SETEND = 126;
	public static final int ARM_INS_SHA1C = 127;
	public static final int ARM_INS_SHA1H = 128;
	public static final int ARM_INS_SHA1M = 129;
	public static final int ARM_INS_SHA1P = 130;
	public static final int ARM_INS_SHA1SU0 = 131;
	public static final int ARM_INS_SHA1SU1 = 132;
	public static final int ARM_INS_SHA256H = 133;
	public static final int ARM_INS_SHA256H2 = 134;
	public static final int ARM_INS_SHA256SU0 = 135;
	public static final int ARM_INS_SHA256SU1 = 136;
	public static final int ARM_INS_SHADD16 = 137;
	public static final int ARM_INS_SHADD8 = 138;
	public static final int ARM_INS_SHASX = 139;
	public static final int ARM_INS_SHSAX = 140;
	public static final int ARM_INS_SHSUB16 = 141;
	public static final int ARM_INS_SHSUB8 = 142;
	public static final int ARM_INS_SMC = 143;
	public static final int ARM_INS_SMLABB = 144;
	public static final int ARM_INS_SMLABT = 145;
	public static final int ARM_INS_SMLAD = 146;
	public static final int ARM_INS_SMLADX = 147;
	public static final int ARM_INS_SMLAL = 148;
	public static final int ARM_INS_SMLALBB = 149;
	public static final int ARM_INS_SMLALBT = 150;
	public static final int ARM_INS_SMLALD = 151;
	public static final int ARM_INS_SMLALDX = 152;
	public static final int ARM_INS_SMLALTB = 153;
	public static final int ARM_INS_SMLALTT = 154;
	public static final int ARM_INS_SMLATB = 155;
	public static final int ARM_INS_SMLATT = 156;
	public static final int ARM_INS_SMLAWB = 157;
	public static final int ARM_INS_SMLAWT = 158;
	public static final int ARM_INS_SMLSD = 159;
	public static final int ARM_INS_SMLSDX = 160;
	public static final int ARM_INS_SMLSLD = 161;
	public static final int ARM_INS_SMLSLDX = 162;
	public static final int ARM_INS_SMMLA = 163;
	public static final int ARM_INS_SMMLAR = 164;
	public static final int ARM_INS_SMMLS = 165;
	public static final int ARM_INS_SMMLSR = 166;
	public static final int ARM_INS_SMMUL = 167;
	public static final int ARM_INS_SMMULR = 168;
	public static final int ARM_INS_SMUAD = 169;
	public static final int ARM_INS_SMUADX = 170;
	public static final int ARM_INS_SMULBB = 171;
	public static final int ARM_INS_SMULBT = 172;
	public static final int ARM_INS_SMULL = 173;
	public static final int ARM_INS_SMULTB = 174;
	public static final int ARM_INS_SMULTT = 175;
	public static final int ARM_INS_SMULWB = 176;
	public static final int ARM_INS_SMULWT = 177;
	public static final int ARM_INS_SMUSD = 178;
	public static final int ARM_INS_SMUSDX = 179;
	public static final int ARM_INS_SRSDA = 180;
	public static final int ARM_INS_SRSDB = 181;
	public static final int ARM_INS_SRSIA = 182;
	public static final int ARM_INS_SRSIB = 183;
	public static final int ARM_INS_SSAT = 184;
	public static final int ARM_INS_SSAT16 = 185;
	public static final int ARM_INS_SSAX = 186;
	public static final int ARM_INS_SSUB16 = 187;
	public static final int ARM_INS_SSUB8 = 188;
	public static final int ARM_INS_STC2L = 189;
	public static final int ARM_INS_STC2 = 190;
	public static final int ARM_INS_STCL = 191;
	public static final int ARM_INS_STC = 192;
	public static final int ARM_INS_STL = 193;
	public static final int ARM_INS_STLB = 194;
	public static final int ARM_INS_STLEX = 195;
	public static final int ARM_INS_STLEXB = 196;
	public static final int ARM_INS_STLEXD = 197;
	public static final int ARM_INS_STLEXH = 198;
	public static final int ARM_INS_STLH = 199;
	public static final int ARM_INS_STMDA = 200;
	public static final int ARM_INS_STMDB = 201;
	public static final int ARM_INS_STM = 202;
	public static final int ARM_INS_STMIB = 203;
	public static final int ARM_INS_STRBT = 204;
	public static final int ARM_INS_STRB = 205;
	public static final int ARM_INS_STRD = 206;
	public static final int ARM_INS_STREX = 207;
	public static final int ARM_INS_STREXB = 208;
	public static final int ARM_INS_STREXD = 209;
	public static final int ARM_INS_STREXH = 210;
	public static final int ARM_INS_STRH = 211;
	public static final int ARM_INS_STRHT = 212;
	public static final int ARM_INS_STRT = 213;
	public static final int ARM_INS_STR = 214;
	public static final int ARM_INS_SUB = 215;
	public static final int ARM_INS_SVC = 216;
	public static final int ARM_INS_SWP = 217;
	public static final int ARM_INS_SWPB = 218;
	public static final int ARM_INS_SXTAB = 219;
	public static final int ARM_INS_SXTAB16 = 220;
	public static final int ARM_INS_SXTAH = 221;
	public static final int ARM_INS_SXTB = 222;
	public static final int ARM_INS_SXTB16 = 223;
	public static final int ARM_INS_SXTH = 224;
	public static final int ARM_INS_TEQ = 225;
	public static final int ARM_INS_TRAP = 226;
	public static final int ARM_INS_TST = 227;
	public static final int ARM_INS_UADD16 = 228;
	public static final int ARM_INS_UADD8 = 229;
	public static final int ARM_INS_UASX = 230;
	public static final int ARM_INS_UBFX = 231;
	public static final int ARM_INS_UDF = 232;
	public static final int ARM_INS_UDIV = 233;
	public static final int ARM_INS_UHADD16 = 234;
	public static final int ARM_INS_UHADD8 = 235;
	public static final int ARM_INS_UHASX = 236;
	public static final int ARM_INS_UHSAX = 237;
	public static final int ARM_INS_UHSUB16 = 238;
	public static final int ARM_INS_UHSUB8 = 239;
	public static final int ARM_INS_UMAAL = 240;
	public static final int ARM_INS_UMLAL = 241;
	public static final int ARM_INS_UMULL = 242;
	public static final int ARM_INS_UQADD16 = 243;
	public static final int ARM_INS_UQADD8 = 244;
	public static final int ARM_INS_UQASX = 245;
	public static final int ARM_INS_UQSAX = 246;
	public static final int ARM_INS_UQSUB16 = 247;
	public static final int ARM_INS_UQSUB8 = 248;
	public static final int ARM_INS_USAD8 = 249;
	public static final int ARM_INS_USADA8 = 250;
	public static final int ARM_INS_USAT = 251;
	public static final int ARM_INS_USAT16 = 252;
	public static final int ARM_INS_USAX = 253;
	public static final int ARM_INS_USUB16 = 254;
	public static final int ARM_INS_USUB8 = 255;
	public static final int ARM_INS_UXTAB = 256;
	public static final int ARM_INS_UXTAB16 = 257;
	public static final int ARM_INS_UXTAH = 258;
	public static final int ARM_INS_UXTB = 259;
	public static final int ARM_INS_UXTB16 = 260;
	public static final int ARM_INS_UXTH = 261;
	public static final int ARM_INS_VABAL = 262;
	public static final int ARM_INS_VABA = 263;
	public static final int ARM_INS_VABDL = 264;
	public static final int ARM_INS_VABD = 265;
	public static final int ARM_INS_VABS = 266;
	public static final int ARM_INS_VACGE = 267;
	public static final int ARM_INS_VACGT = 268;
	public static final int ARM_INS_VADD = 269;
	public static final int ARM_INS_VADDHN = 270;
	public static final int ARM_INS_VADDL = 271;
	public static final int ARM_INS_VADDW = 272;
	public static final int ARM_INS_VAND = 273;
	public static final int ARM_INS_VBIC = 274;
	public static final int ARM_INS_VBIF = 275;
	public static final int ARM_INS_VBIT = 276;
	public static final int ARM_INS_VBSL = 277;
	public static final int ARM_INS_VCEQ = 278;
	public static final int ARM_INS_VCGE = 279;
	public static final int ARM_INS_VCGT = 280;
	public static final int ARM_INS_VCLE = 281;
	public static final int ARM_INS_VCLS = 282;
	public static final int ARM_INS_VCLT = 283;
	public static final int ARM_INS_VCLZ = 284;
	public static final int ARM_INS_VCMP = 285;
	public static final int ARM_INS_VCMPE = 286;
	public static final int ARM_INS_VCNT = 287;
	public static final int ARM_INS_VCVTA = 288;
	public static final int ARM_INS_VCVTB = 289;
	public static final int ARM_INS_VCVT = 290;
	public static final int ARM_INS_VCVTM = 291;
	public static final int ARM_INS_VCVTN = 292;
	public static final int ARM_INS_VCVTP = 293;
	public static final int ARM_INS_VCVTT = 294;
	public static final int ARM_INS_VDIV = 295;
	public static final int ARM_INS_VDUP = 296;
	public static final int ARM_INS_VEOR = 297;
	public static final int ARM_INS_VEXT = 298;
	public static final int ARM_INS_VFMA = 299;
	public static final int ARM_INS_VFMS = 300;
	public static final int ARM_INS_VFNMA = 301;
	public static final int ARM_INS_VFNMS = 302;
	public static final int ARM_INS_VHADD = 303;
	public static final int ARM_INS_VHSUB = 304;
	public static final int ARM_INS_VLD1 = 305;
	public static final int ARM_INS_VLD2 = 306;
	public static final int ARM_INS_VLD3 = 307;
	public static final int ARM_INS_VLD4 = 308;
	public static final int ARM_INS_VLDMDB = 309;
	public static final int ARM_INS_VLDMIA = 310;
	public static final int ARM_INS_VLDR = 311;
	public static final int ARM_INS_VMAXNM = 312;
	public static final int ARM_INS_VMAX = 313;
	public static final int ARM_INS_VMINNM = 314;
	public static final int ARM_INS_VMIN = 315;
	public static final int ARM_INS_VMLA = 316;
	public static final int ARM_INS_VMLAL = 317;
	public static final int ARM_INS_VMLS = 318;
	public static final int ARM_INS_VMLSL = 319;
	public static final int ARM_INS_VMOVL = 320;
	public static final int ARM_INS_VMOVN = 321;
	public static final int ARM_INS_VMSR = 322;
	public static final int ARM_INS_VMUL = 323;
	public static final int ARM_INS_VMULL = 324;
	public static final int ARM_INS_VMVN = 325;
	public static final int ARM_INS_VNEG = 326;
	public static final int ARM_INS_VNMLA = 327;
	public static final int ARM_INS_VNMLS = 328;
	public static final int ARM_INS_VNMUL = 329;
	public static final int ARM_INS_VORN = 330;
	public static final int ARM_INS_VORR = 331;
	public static final int ARM_INS_VPADAL = 332;
	public static final int ARM_INS_VPADDL = 333;
	public static final int ARM_INS_VPADD = 334;
	public static final int ARM_INS_VPMAX = 335;
	public static final int ARM_INS_VPMIN = 336;
	public static final int ARM_INS_VQABS = 337;
	public static final int ARM_INS_VQADD = 338;
	public static final int ARM_INS_VQDMLAL = 339;
	public static final int ARM_INS_VQDMLSL = 340;
	public static final int ARM_INS_VQDMULH = 341;
	public static final int ARM_INS_VQDMULL = 342;
	public static final int ARM_INS_VQMOVUN = 343;
	public static final int ARM_INS_VQMOVN = 344;
	public static final int ARM_INS_VQNEG = 345;
	public static final int ARM_INS_VQRDMULH = 346;
	public static final int ARM_INS_VQRSHL = 347;
	public static final int ARM_INS_VQRSHRN = 348;
	public static final int ARM_INS_VQRSHRUN = 349;
	public static final int ARM_INS_VQSHL = 350;
	public static final int ARM_INS_VQSHLU = 351;
	public static final int ARM_INS_VQSHRN = 352;
	public static final int ARM_INS_VQSHRUN = 353;
	public static final int ARM_INS_VQSUB = 354;
	public static final int ARM_INS_VRADDHN = 355;
	public static final int ARM_INS_VRECPE = 356;
	public static final int ARM_INS_VRECPS = 357;
	public static final int ARM_INS_VREV16 = 358;
	public static final int ARM_INS_VREV32 = 359;
	public static final int ARM_INS_VREV64 = 360;
	public static final int ARM_INS_VRHADD = 361;
	public static final int ARM_INS_VRINTA = 362;
	public static final int ARM_INS_VRINTM = 363;
	public static final int ARM_INS_VRINTN = 364;
	public static final int ARM_INS_VRINTP = 365;
	public static final int ARM_INS_VRINTR = 366;
	public static final int ARM_INS_VRINTX = 367;
	public static final int ARM_INS_VRINTZ = 368;
	public static final int ARM_INS_VRSHL = 369;
	public static final int ARM_INS_VRSHRN = 370;
	public static final int ARM_INS_VRSHR = 371;
	public static final int ARM_INS_VRSQRTE = 372;
	public static final int ARM_INS_VRSQRTS = 373;
	public static final int ARM_INS_VRSRA = 374;
	public static final int ARM_INS_VRSUBHN = 375;
	public static final int ARM_INS_VSELEQ = 376;
	public static final int ARM_INS_VSELGE = 377;
	public static final int ARM_INS_VSELGT = 378;
	public static final int ARM_INS_VSELVS = 379;
	public static final int ARM_INS_VSHLL = 380;
	public static final int ARM_INS_VSHL = 381;
	public static final int ARM_INS_VSHRN = 382;
	public static final int ARM_INS_VSHR = 383;
	public static final int ARM_INS_VSLI = 384;
	public static final int ARM_INS_VSQRT = 385;
	public static final int ARM_INS_VSRA = 386;
	public static final int ARM_INS_VSRI = 387;
	public static final int ARM_INS_VST1 = 388;
	public static final int ARM_INS_VST2 = 389;
	public static final int ARM_INS_VST3 = 390;
	public static final int ARM_INS_VST4 = 391;
	public static final int ARM_INS_VSTMDB = 392;
	public static final int ARM_INS_VSTMIA = 393;
	public static final int ARM_INS_VSTR = 394;
	public static final int ARM_INS_VSUB = 395;
	public static final int ARM_INS_VSUBHN = 396;
	public static final int ARM_INS_VSUBL = 397;
	public static final int ARM_INS_VSUBW = 398;
	public static final int ARM_INS_VSWP = 399;
	public static final int ARM_INS_VTBL = 400;
	public static final int ARM_INS_VTBX = 401;
	public static final int ARM_INS_VCVTR = 402;
	public static final int ARM_INS_VTRN = 403;
	public static final int ARM_INS_VTST = 404;
	public static final int ARM_INS_VUZP = 405;
	public static final int ARM_INS_VZIP = 406;
	public static final int ARM_INS_ADDW = 407;
	public static final int ARM_INS_ASR = 408;
	public static final int ARM_INS_DCPS1 = 409;
	public static final int ARM_INS_DCPS2 = 410;
	public static final int ARM_INS_DCPS3 = 411;
	public static final int ARM_INS_IT = 412;
	public static final int ARM_INS_LSL = 413;
	public static final int ARM_INS_LSR = 414;
	public static final int ARM_INS_ORN = 415;
	public static final int ARM_INS_ROR = 416;
	public static final int ARM_INS_RRX = 417;
	public static final int ARM_INS_SUBW = 418;
	public static final int ARM_INS_TBB = 419;
	public static final int ARM_INS_TBH = 420;
	public static final int ARM_INS_CBNZ = 421;
	public static final int ARM_INS_CBZ = 422;
	public static final int ARM_INS_POP = 423;
	public static final int ARM_INS_PUSH = 424;
	public static final int ARM_INS_NOP = 425;
	public static final int ARM_INS_YIELD = 426;
	public static final int ARM_INS_WFE = 427;
	public static final int ARM_INS_WFI = 428;
	public static final int ARM_INS_SEV = 429;
	public static final int ARM_INS_SEVL = 430;
	public static final int ARM_INS_VPUSH = 431;
	public static final int ARM_INS_VPOP = 432;
	public static final int ARM_INS_ENDING = 433;

	// Group of ARM instructions

	public static final int ARM_GRP_INVALID = 0;

	// Generic groups
	public static final int ARM_GRP_JUMP = 1;
	public static final int ARM_GRP_CALL = 2;
	public static final int ARM_GRP_INT = 4;
	public static final int ARM_GRP_PRIVILEGE = 6;

	// Architecture-specific groups
	public static final int ARM_GRP_CRYPTO = 128;
	public static final int ARM_GRP_DATABARRIER = 129;
	public static final int ARM_GRP_DIVIDE = 130;
	public static final int ARM_GRP_FPARMV8 = 131;
	public static final int ARM_GRP_MULTPRO = 132;
	public static final int ARM_GRP_NEON = 133;
	public static final int ARM_GRP_T2EXTRACTPACK = 134;
	public static final int ARM_GRP_THUMB2DSP = 135;
	public static final int ARM_GRP_TRUSTZONE = 136;
	public static final int ARM_GRP_V4T = 137;
	public static final int ARM_GRP_V5T = 138;
	public static final int ARM_GRP_V5TE = 139;
	public static final int ARM_GRP_V6 = 140;
	public static final int ARM_GRP_V6T2 = 141;
	public static final int ARM_GRP_V7 = 142;
	public static final int ARM_GRP_V8 = 143;
	public static final int ARM_GRP_VFP2 = 144;
	public static final int ARM_GRP_VFP3 = 145;
	public static final int ARM_GRP_VFP4 = 146;
	public static final int ARM_GRP_ARM = 147;
	public static final int ARM_GRP_MCLASS = 148;
	public static final int ARM_GRP_NOTMCLASS = 149;
	public static final int ARM_GRP_THUMB = 150;
	public static final int ARM_GRP_THUMB1ONLY = 151;
	public static final int ARM_GRP_THUMB2 = 152;
	public static final int ARM_GRP_PREV8 = 153;
	public static final int ARM_GRP_FPVMLX = 154;
	public static final int ARM_GRP_MULOPS = 155;
	public static final int ARM_GRP_CRC = 156;
	public static final int ARM_GRP_DPVFP = 157;
	public static final int ARM_GRP_V6M = 158;
	public static final int ARM_GRP_VIRTUALIZATION = 159;
	public static final int ARM_GRP_ENDING = 160;
}