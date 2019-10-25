//
//  M68kCPU.m
//  M68kCPU
//
//  Created by Vincent Bénony on 04/03/2014.
//  Copyright (c) 2014 Cryptic Apps. All rights reserved.
//

#import "M68kCPU.h"
#import "M68kCtx.h"

#ifdef LINUX
#include <endian.h>

void OSWriteBigInt16(void *address, uintptr_t offset, int16_t data) {
    *(int16_t *) ((uintptr_t) address + offset) = htobe16(data);
}

#endif

@implementation M68kCPU {
    NSObject<HPHopperServices> *_services;
}

- (Class)cpuContextClass {
    return [M68kCtx class];
}

+ (int)sdkVersion {
    return HOPPER_CURRENT_SDK_VERSION;
}

- (instancetype)initWithHopperServices:(NSObject<HPHopperServices> *)services {
    if (self = [super init]) {
        _services = services;
    }
    return self;
}

- (NSObject<HPHopperServices> *)hopperServices {
    return _services;
}

- (NSObject<CPUContext> *)buildCPUContextForFile:(NSObject<HPDisassembledFile> *)file {
    return [[M68kCtx alloc] initWithCPU:self andFile:file];
}

- (NSObject<HPHopperUUID> *)pluginUUID {
    return [_services UUIDWithString:@"82196c67-cf5e-441f-a7b9-7d2ca5e101a4"];
}

- (HopperPluginType)pluginType {
    return Plugin_CPU;
}

- (NSString *)pluginName {
    return @"Motorola";
}

- (NSString *)pluginDescription {
    return @"Motorola 68000 CPU support";
}

- (NSString *)pluginAuthor {
    return @"Vincent Bénony";
}

- (NSString *)pluginCopyright {
    return @"© Cryptic Apps SARL";
}

- (NSArray *)cpuFamilies {
    return @[@"motorola"];
}

- (NSArray<NSString *> *)commandLineIdentifiers {
    return @[@"motorola"];
}

- (NSString *)pluginVersion {
    return @"0.0.1";
}

- (NSArray *)cpuSubFamiliesForFamily:(NSString *)family {
    if ([family isEqualToString:@"motorola"]) return @[@"68000"];
    return nil;
}

- (int)addressSpaceWidthInBitsForCPUFamily:(NSString *)family andSubFamily:(NSString *)subFamily {
    if ([family isEqualToString:@"motorola"] && [subFamily isEqualToString:@"68000"]) return 32;
    return 0;
}

- (int)integerWidthInBitsForCPUFamily:(NSString *)family andSubFamily:(NSString *)subFamily {
    if ([family isEqualToString:@"motorola"] && [subFamily isEqualToString:@"68000"]) return 32;
    return 0;
}

- (CPUEndianess)endianess {
    return CPUEndianess_Big;
}

- (NSUInteger)cpuModeCount {
    return 1;
}

- (NSArray<NSString *> *)cpuModeNames {
    return @[@"generic"];
}

- (NSUInteger)syntaxVariantCount {
    return 2;
}

- (NSArray<NSString *> *)syntaxVariantNames {
    return @[@"lowercase", @"uppercase"];
}

- (NSString *)framePointerRegisterNameForFile:(NSObject<HPDisassembledFile> *)file cpuMode:(uint8_t)cpuMode {
    return nil;
}

- (NSUInteger)registerClassCount {
    return RegClass_M68k_Cnt;
}

- (NSUInteger)registerCountForClass:(RegClass)reg_class {
    switch (reg_class) {
        case RegClass_CPUState: return 1;
        case RegClass_PseudoRegisterSTACK: return 32;
        case RegClass_GeneralPurposeRegister: return 8;
        case RegClass_AddressRegister: return 8;
        default: break;
    }
    return 0;
}

- (BOOL)registerIndexIsStackPointer:(NSUInteger)reg ofClass:(RegClass)reg_class cpuMode:(uint8_t)cpuMode file:(NSObject<HPDisassembledFile> *)file {
    return reg_class == RegClass_AddressRegister && reg == 7;
}

- (BOOL)registerIndexIsFrameBasePointer:(NSUInteger)reg ofClass:(RegClass)reg_class cpuMode:(uint8_t)cpuMode file:(NSObject<HPDisassembledFile> *)file {
    return NO;
}

- (BOOL)registerIndexIsProgramCounter:(NSUInteger)reg cpuMode:(uint8_t)cpuMode file:(NSObject<HPDisassembledFile> *)file {
    return NO;
}

- (BOOL)registerHasSideEffectForIndex:(NSUInteger)reg andClass:(RegClass)reg_class {
    return reg_class == RegClass_CPUState;
}

- (NSString *)lowercaseStringForRegister:(NSUInteger)reg ofClass:(RegClass)reg_class {
    switch (reg_class) {
        case RegClass_CPUState:
            if (reg < 21) {
                static NSString *names[] = {
                    @"sr",    @"ccr",  @"sfc",
                    @"dfc",   @"usp",  @"vbr",
                    @"cacr",  @"caar", @"msp",
                    @"isp",   @"tc",   @"itt0",
                    @"itt1",  @"dtt0", @"dtt1",
                    @"mmusr", @"urp",  @"srp",
                    @"fpcr",  @"fpsr", @"fpiar"
                };
                return names[reg];
            }
            return [NSString stringWithFormat:@"UNKNOWN_CPUSTATE_REG<%lld>", (long long) reg];
        case RegClass_PseudoRegisterSTACK: return [NSString stringWithFormat:@"stk%d", (int) reg];
        case RegClass_GeneralPurposeRegister: return [NSString stringWithFormat:@"d%d", (int) reg];
        case RegClass_AddressRegister:
            if (reg == 8) return @"pc";
            return [NSString stringWithFormat:@"a%d", (int) reg];
        case RegClass_FPRegister: return [NSString stringWithFormat:@"fp%d", (int) reg];
        default: break;
    }
    return nil;
}

- (NSString *)registerIndexToString:(NSUInteger)reg ofClass:(RegClass)reg_class withBitSize:(NSUInteger)size position:(DisasmPosition)position andSyntaxIndex:(NSUInteger)syntaxIndex {
    NSString *regName = [self lowercaseStringForRegister:reg ofClass:reg_class];
    if (syntaxIndex == 1) regName = [regName uppercaseString];
    return regName;
}

- (NSString *)cpuRegisterStateMaskToString:(uint32_t)cpuState {
    return @"";
}

- (NSUInteger)translateOperandIndex:(NSUInteger)index operandCount:(NSUInteger)count accordingToSyntax:(uint8_t)syntaxIndex {
    return index;
}

- (NSData *)nopWithSize:(NSUInteger)size andMode:(NSUInteger)cpuMode forFile:(NSObject<HPDisassembledFile> *)file {
    // Instruction size is always a multiple of 2
    if (size & 1) return nil;
    NSMutableData *nopArray = [[NSMutableData alloc] initWithCapacity:size];
    [nopArray setLength:size];
    uint16_t *ptr = (uint16_t *)[nopArray mutableBytes];
    for (NSUInteger i=0; i<size; i+=2) {
        OSWriteBigInt16(ptr, i, 0x4E71);
    }
    return [NSData dataWithData:nopArray];
}

- (BOOL)canAssembleInstructionsForCPUFamily:(NSString *)family andSubFamily:(NSString *)subFamily {
    return NO;
}

- (BOOL)canDecompileProceduresForCPUFamily:(NSString *)family andSubFamily:(NSString *)subFamily {
    return NO;
}

@end
