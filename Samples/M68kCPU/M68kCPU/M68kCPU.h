//
//  M68kCPU.h
//  M68kCPU
//
//  Created by Vincent Bénony on 04/03/2014.
//  Copyright (c) 2014 Cryptic Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Hopper/Hopper.h>

typedef NS_ENUM(NSUInteger, M68kRegClass) {
    RegClass_AddressRegister = RegClass_FirstUserClass,
    RegClass_FPRegister,
    RegClass_M68k_Cnt
};

typedef NS_ENUM(NSUInteger, M68kIncrement) {
    INCR_NoIncrement,
    INCR_Postincrement,
    INCR_Predecrement
};

// Indexes used with the "userData" field of the DisasmOperand structure
#define DISASM_M68K_OP_USER_INCREMENT         0
#define DISASM_M68K_OP_USER_INDEX_REG_CLASS   1
#define DISASM_M68K_OP_USER_REGLIST           2

@interface M68kCPU : NSObject<CPUDefinition>

- (NSObject<HPHopperServices> *)hopperServices;

@end
