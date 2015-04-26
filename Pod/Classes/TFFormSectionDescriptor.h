//
//  TFFormSectionDescriptor.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFSectionDescriptor.h"

@class TFFormRowDescriptor;

@interface TFFormSectionDescriptor : NSObject

@property (strong, nonatomic) TFSectionDescriptor *sectionDescriptor;

+ (instancetype)descriptorWithClass:(Class)c tag:(NSInteger)tag data:(id)data;
+ (instancetype)descriptorWithTag:(NSInteger)tag data:(id)data;

- (void)addRow:(TFFormRowDescriptor *)formRowDescriptor;

@end
