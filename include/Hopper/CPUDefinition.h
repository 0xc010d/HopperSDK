//
// Hopper Disassembler SDK
//
// (c)2016 - Cryptic Apps SARL. All Rights Reserved.
// https://www.hopperapp.com
//
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//

#import <Foundation/Foundation.h>
#import "CPUContext.h"
#import "HopperPlugin.h"
#import "CommonTypes.h"

@protocol CPUDefinition <NSObject,HopperPlugin>

/// Build a context for disassembling.
/// This method should be fast, because it'll be called very often.
- (NSObject<CPUContext> *)buildCPUContextForFile:(NSObject<HPDisassembledFile> *)file;

/// Returns an array of NSString of CPU families handled by the plugin.
- (NSArray<NSString *> *)cpuFamilies;
/// Returns an array of NSString of CPU subfamilies handled by the plugin for a given CPU family.
- (NSArray<NSString *> *)cpuSubFamiliesForFamily:(NSString *)family;
/// Returns 32 or 64, according to the family and subFamily arguments.
- (int)addressSpaceWidthInBitsForCPUFamily:(NSString *)family andSubFamily:(NSString *)subFamily;

/// Default endianess of the CPU.
- (CPUEndianess)endianess;
/// Usually, returns 1, but for the Intel processor, it'll return 2 because we have the Intel and the AT&T syntaxes.
- (NSUInteger)syntaxVariantCount;
/// The number of CPU modes. For instance, 2 for the ARM CPU family: ARM and Thumb modes.
- (NSUInteger)cpuModeCount;

- (NSArray<NSString *> *)syntaxVariantNames;
- (NSArray<NSString *> *)cpuModeNames;

- (NSUInteger)registerClassCount;
- (NSUInteger)registerCountForClass:(RegClass)reg_class;
- (NSString *)registerIndexToString:(NSUInteger)reg ofClass:(RegClass)reg_class withBitSize:(NSUInteger)size andPosition:(DisasmPosition)position;
- (NSString *)cpuRegisterStateMaskToString:(uint32_t)cpuState;
- (BOOL)registerIndexIsStackPointer:(NSUInteger)reg ofClass:(RegClass)reg_class;
- (BOOL)registerIndexIsFrameBasePointer:(NSUInteger)reg ofClass:(RegClass)reg_class;
- (BOOL)registerIndexIsProgramCounter:(NSUInteger)reg;
// Returns the name of the frame pointer register, ie, "bp" for x86, or "r7" for ARM.
- (NSString *)framePointerRegisterNameForFile:(NSObject<HPDisassembledFile>*)file;

/// Returns a array of bytes that represents a NOP instruction of a given size.
- (NSData *)nopWithSize:(NSUInteger)size andMode:(NSUInteger)cpuMode forFile:(NSObject<HPDisassembledFile> *)file;

/// Return YES if the plugin embed an assembler.
- (BOOL)canAssembleInstructionsForCPUFamily:(NSString *)family andSubFamily:(NSString *)subFamily;

/// Return YES if the plugin embed a decompiler.
/// Note: you cannot create a decompiler yet, because the main class (ASTNode) is not
/// publicly exposed yet.
- (BOOL)canDecompileProceduresForCPUFamily:(NSString *)family andSubFamily:(NSString *)subFamily;

@end
