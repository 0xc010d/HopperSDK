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

#import "CommonTypes.h"

@protocol HPSection;

@protocol HPSegment

@property (nonatomic, copy) NSString *segmentName;

@property (nonatomic) uint64_t fileOffset;
@property (nonatomic) uint64_t fileLength;

- (BOOL)hasMappedData;
- (NSData *)mappedData;
- (void)setMappedData:(NSData *)data;

- (Address)startAddress;
- (Address)endAddress;
- (size_t)length;

- (BOOL)containsVirtualAddress:(Address)virtualAddress;

- (NSArray<NSObject<HPSection> *> *)sections;
- (NSUInteger)sectionCount;

- (NSObject<HPSegment> *)nextSegment;
- (NSObject<HPSegment> *)previousSegment;

- (NSObject<HPSection> *)addSectionAt:(Address)address size:(size_t)length;
- (NSObject<HPSection> *)addSectionAt:(Address)address toExcludedAddress:(Address)endAddress;

- (NSObject<HPSection> *)firstSection;
- (NSObject<HPSection> *)lastSection;
- (NSObject<HPSection> *)sectionNamed:(NSString *)name;

// XREFs
- (NSArray<NSNumber *> *)referencesToAddress:(Address)virtualAddress;
- (NSArray<NSNumber *> *)referencesFromAddress:(Address)virtualAddress;
- (void)removeReferencesOfAddress:(Address)referenced fromAddress:(Address)origin;
- (void)addReferencesToAddress:(Address)referenced fromAddress:(Address)origin;

@end
