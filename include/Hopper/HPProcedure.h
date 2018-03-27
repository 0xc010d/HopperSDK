//
// Hopper Disassembler SDK
//
// (c) Cryptic Apps SARL. All Rights Reserved.
// https://www.hopperapp.com
//
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//

#import "CommonTypes.h"

@protocol HPTag;
@protocol HPBasicBlock;
@protocol HPSegment;
@protocol HPCallReference;
@protocol HPMethodSignature;
@protocol CPUContext;

@protocol HPProcedure

- (BOOL)bpBasedFrame;
- (int32_t)savedRegistersSize;
- (int32_t)framePointerOffset;
- (int32_t)purgedBytes;
- (int32_t)localsSize;

- (NSUInteger)basicBlockCount;
- (NSObject<HPBasicBlock> *)firstBasicBlock;
- (NSObject<HPBasicBlock> *)basicBlockStartingAt:(Address)address;
- (NSObject<HPBasicBlock> *)basicBlockContainingInstructionAt:(Address)address;
- (NSObject<HPBasicBlock> *)basicBlockAtIndex:(NSUInteger)index;

- (NSObject<HPSegment> *)segment;

- (Address)entryPoint;
- (NSArray<NSObject<HPBasicBlock> *> *)allExitBlocks;

// Stack
- (int32_t)stackPointerOffsetAt:(Address)address;

// Local Labels
- (BOOL)hasLocalLabelAtAddress:(Address)address;
- (NSString *)localLabelAtAddress:(Address)address;
- (void)setLocalLabel:(NSString *)name atAddress:(Address)address;
- (NSString *)declareLocalLabelAt:(Address)address;
- (void)removeLocalLabelAtAddress:(Address)address;
- (Address)addressOfLocalLabel:(NSString *)name;

// Rename register
- (void)renameRegisterOfClass:(RegClass)regCls andIndex:(NSUInteger)regIndex to:(NSString *)name;
- (NSString *)nameOverrideForRegisterOfClass:(RegClass)regCls andIndex:(NSUInteger)regIndex;
- (void)clearNameOverrideForRegisterOfClass:(RegClass)regCls andIndex:(NSUInteger)regIndex;

// Call Graph
- (NSArray<NSObject<HPCallReference> *> *)allCallers;
- (NSArray<NSObject<HPCallReference> *> *)allCallees;

- (NSArray<NSObject<HPProcedure> *> *)allCalleeProcedures;
- (NSArray<NSObject<HPProcedure> *> *)allCallerProcedures;

// Variables
- (NSString *)variableNameForDisplacement:(int64_t)disp;
- (BOOL)setVariableName:(NSString *)name forDisplacement:(int64_t)disp;
- (NSString *)resolvedVariableNameForDisplacement:(int64_t)disp usingCPUContext:(NSObject<CPUContext> *)cpuContext;

// Signature
- (NSObject<HPMethodSignature> *)signature;
- (void)setSignature:(NSObject<HPMethodSignature> *)signature reason:(SignatureCreationReason)reason;
- (void)setSignature:(NSObject<HPMethodSignature> *)signature propagatingSignature:(BOOL)propagateSignature reason:(SignatureCreationReason)reason;
- (CallingConvention)callingConvention;
- (CallingConvention)resolvedCallingConvention;
- (void)setCallingConvention:(CallingConvention)cc;

// Tags
- (void)addTag:(NSObject<HPTag> *)tag;
- (void)removeTag:(NSObject<HPTag> *)tag;
- (BOOL)hasTag:(NSObject<HPTag> *)tag;

@end
