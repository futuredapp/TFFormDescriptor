//
//  TFFormRowDescriptor.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormFieldDescriptor.h"

#import "TFFormSectionDescriptor.h"
#import "TFFormDescriptor.h"
#import "TFTableDescriptor+FormReference.h"

@implementation TFFormFieldDescriptor

+ (instancetype)descriptorWithClass:(Class)c configuration:(TFRowConfiguration *)cfg tag:(NSString *)tag {
    
    TFFormFieldDescriptor *formRowDescriptor = [[TFFormFieldDescriptor alloc] init];
    TFRowDescriptor *rowDescriptor = [TFRowDescriptor descriptorWithRowClass:c data:cfg tag:tag];
    rowDescriptor.formRowDescriptor = formRowDescriptor;
    formRowDescriptor.rowDescriptor = rowDescriptor;
    
    return formRowDescriptor;
}


-(void)setValue:(id)value{
    _value = value;
//    [self.formSectionDescriptor.formDescriptor updateValueDataAtField:self];
}

@end
