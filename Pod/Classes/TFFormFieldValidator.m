//
//  TFFormFieldValidator.m
//  Pods
//
//  Created by Jakub Knejzlik on 20/05/15.
//
//

#import "TFFormFieldValidator.h"

#import <NSString+Email.h>

@implementation TFFormFieldValidator

+ (instancetype)fieldValidatorWithValidationBlock:(TFFormValidationBlock)validationBlock{
    return [[self alloc] initWithValidationBlock:validationBlock];
}

-(instancetype)initWithValidationBlock:(TFFormValidationBlock)validationBlock{
    self = [super init];
    if (self) {
        self.validationBlock = validationBlock;
    }
    return self;
}

+ (instancetype)emailFieldValidator{
    return [self fieldValidatorWithValidationBlock:^BOOL(TFFormFieldDescriptor *field, TFFormValidationError *__autoreleasing *error) {
        BOOL isValid = [field.value isKindOfClass:[NSString class]] && [(NSString *)field isEmail];
        if (!isValid) {
            *error = [TFFormValidationError errorWithField:field reason:NSLocalizedString(@"NOT_A_VALID_EMAIL", nil) userInfo:nil];
        }
        return isValid;
    }];
}

- (BOOL)validateForField:(TFFormFieldDescriptor *)field error:(TFFormValidationError **)error{
    return self.validationBlock(field,error);
}

@end
