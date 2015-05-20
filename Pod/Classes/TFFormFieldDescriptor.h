//
//  TFFormRowDescriptor.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import <TFRowDescriptor.h>
#import "TFFormBaseField.h"
#import "TFRowDescriptor+FormFieldReference.h"

@class TFFormSectionDescriptor,TFFormDescriptor,TFFormFieldValidator;

@interface TFFormFieldDescriptor : NSObject

@property (strong, nonatomic) TFRowDescriptor *rowDescriptor;
@property (weak, nonatomic) TFFormSectionDescriptor *formSectionDescriptor;

@property (strong, nonatomic) id value;

@property (copy, nonatomic) BOOL (^displayBlock)(TFFormDescriptor *formDescriptor);

+ (instancetype)descriptorWithClass:(Class)c configuration:(TFRowConfiguration *)cfg tag:(NSString *)tag;


#pragma mark - Required

@property (nonatomic) BOOL required;


#pragma mark - Validations

@property (readonly, nonatomic, getter=isValid) BOOL valid;

@property (readonly, nonatomic) NSArray *validationErrors;

- (void)addValidator:(TFFormFieldValidator *)validator;
- (void)addValidators:(NSArray *)validators;
- (void)removeValidator:(TFFormFieldValidator *)validator;
- (void)removeValidators:(NSArray *)validators;

@end
