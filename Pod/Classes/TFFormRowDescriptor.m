//
//  TFFormRowDescriptor.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormRowDescriptor.h"

@implementation TFFormRowDescriptor

+ (instancetype)descriptorWithClass:(Class)c configuration:(TFRowConfiguration *)cfg tag:(NSString *)tag {
    
    TFFormRowDescriptor *formRowDescriptor = [[TFFormRowDescriptor alloc] init];
    formRowDescriptor.rowDescriptor = [TFRowDescriptor descriptorWithRowClass:c data:cfg tag:tag];
    
    return formRowDescriptor;
}

- (id)value {
    
}

@end
