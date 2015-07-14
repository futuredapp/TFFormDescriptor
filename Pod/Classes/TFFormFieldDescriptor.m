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
#import "TFFormFieldValidator.h"

@interface TFFormFieldDescriptor ()
@property (nonatomic,strong) NSMutableArray *validators;
@end

@implementation TFFormFieldDescriptor

+ (instancetype)descriptorWithClass:(Class)c configuration:(TFRowConfiguration *)cfg tag:(NSString *)tag {
    
    TFFormFieldDescriptor *formRowDescriptor = [[TFFormFieldDescriptor alloc] init];
    TFRowDescriptor *rowDescriptor = [TFRowDescriptor descriptorWithRowClass:c data:cfg tag:tag];
    rowDescriptor.formFieldDescriptor = formRowDescriptor;
    formRowDescriptor.rowDescriptor = rowDescriptor;
    
    return formRowDescriptor;
}


-(void)setValue:(id)value{
    _value = value;

    BOOL allValid = YES;
    NSMutableArray *errors = [NSMutableArray array];
    for (TFFormFieldValidator *validator in self.validators) {
        TFFormValidationError *error = nil;
        if (![validator validateForField:self error:&error]) {
            allValid = NO;
            [errors addObject:error];
        }
    }
    
    _validationErrors = errors;
    _valid = allValid;
}


- (void)setDisplayBlock:(BOOL (^)(TFFormDescriptor *))displayBlock{
    _displayBlock = displayBlock;
    if (displayBlock && !self.rowDescriptor.section) {
        [self.rowDescriptor setHidden:!displayBlock(self.formSectionDescriptor.formDescriptor) checkIfUpdating:YES];
    }
}

#pragma mark - Validations

- (NSMutableArray *)validators{
    if (!_validators) {
        _validators = [NSMutableArray array];
    }
    return _validators;
}

- (void)addValidator:(TFFormFieldValidator *)validator{
    NSAssert([validator isKindOfClass:[TFFormFieldValidator class]], @"validator must of class TFFormFieldValidator");
    [self.validators addObject:validator];
}
- (void)addValidators:(NSArray *)validators{
    for (TFFormFieldValidator *validator in validators) {
        [self addValidator:validator];
    }
}
- (void)removeValidator:(TFFormFieldValidator *)validator{
    NSAssert([validator isKindOfClass:[TFFormFieldValidator class]], @"validator must of class TFFormFieldValidator");
    [self.validators removeObject:validator];
}
- (void)removeValidators:(NSArray *)validators{
    for (TFFormFieldValidator *validator in self.validators) {
        [self removeValidator:validator];
    }
}

@end
