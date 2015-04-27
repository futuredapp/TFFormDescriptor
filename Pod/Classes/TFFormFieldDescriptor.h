//
//  TFFormRowDescriptor.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import <TFRowDescriptor.h>
#import "TFFormBaseField.h"
#import "TFRowDescriptor+FormRowReference.h"

@class TFFormSectionDescriptor;

@interface TFFormFieldDescriptor : NSObject

@property (strong, nonatomic) TFRowDescriptor *rowDescriptor;
@property (weak, nonatomic) TFFormSectionDescriptor *formSectionDescriptor;
@property (strong, nonatomic) id value;

+ (instancetype)descriptorWithClass:(Class)c configuration:(TFRowConfiguration *)cfg tag:(NSString *)tag;

@end
