//
//  TFFormFieldValidator.h
//  Pods
//
//  Created by Jakub Knejzlik on 20/05/15.
//
//

#import <Foundation/Foundation.h>

#import "TFFormFieldDescriptor.h"
#import "TFFormValidationError.h"

typedef BOOL (^TFFormValidationBlock) (TFFormFieldDescriptor *field,TFFormValidationError **error);

@interface TFFormFieldValidator : NSObject

@property (copy, nonatomic) TFFormValidationBlock validationBlock;


+ (instancetype)fieldValidatorWithValidationBlock:(TFFormValidationBlock)validationBlock;
- (instancetype)initWithValidationBlock:(TFFormValidationBlock)validationBlock;

+ (instancetype)emailFieldValidator;

- (BOOL)validateForField:(TFFormFieldDescriptor *)field error:(TFFormValidationError **)error;

@end
