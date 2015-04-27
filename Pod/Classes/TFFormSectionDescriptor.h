//
//  TFFormSectionDescriptor.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFSectionDescriptor.h"

@class TFFormFieldDescriptor, TFFormDescriptor;

@interface TFFormSectionDescriptor : NSObject

@property (strong, nonatomic) TFSectionDescriptor *sectionDescriptor;
@property (weak, nonatomic) TFFormDescriptor *formDescriptor;

+ (instancetype)descriptorWithClass:(Class)c tag:(NSInteger)tag data:(id)data;
+ (instancetype)descriptorWithTag:(NSInteger)tag data:(id)data;

- (void)addRow:(TFFormFieldDescriptor *)formRowDescriptor;

@end
