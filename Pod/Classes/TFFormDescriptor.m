//
//  TFFormDescriptor.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormDescriptor.h"
#import "TFTableDescriptor.h"
#import "TFFormBaseField.h"
#import "TFTableDescriptor+FormReference.h"


#pragma mark - TFFormDescriptor

@interface TFFormDescriptor ()<TFTableDescriptorDelegate>

@property (strong, nonatomic) TFTableDescriptor *tableDescriptor;

@property (strong, nonatomic) NSMutableArray *sections;

@end

@implementation TFFormDescriptor

+ (instancetype)descriptorWithTable:(UITableView *)tableView {
    
    return [[[self class] alloc] initWithTable:tableView];
    
}

- (instancetype)initWithTable:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        self.tableDescriptor = [TFTableDescriptor descriptorWithTable:tableView];
        self.tableDescriptor.delegate = self;
        self.tableDescriptor.formDescriptor = self;
        [self registerDefaultFormClasses];
        self.selectedFieldScrollPosition = UITableViewScrollPositionNone;
    }
    return self;
}

- (void)registerDefaultFormClasses {
    for (Class c in [TFFormDescriptor defaultFormsClasses]) {
        REGISTER_CELL_FOR_TABLE(c, self.tableDescriptor.tableView);
    }
}

+ (NSArray *)defaultFormsClasses {
    return @[[TFFormTitledTextField class], [TFFormTitledSwitchField class], [TFFormTitledTextViewField class]];
}

#pragma mark - Adding sections and rows

- (NSMutableArray *)sections{
    if (!_sections) {
        _sections = [NSMutableArray array];
    }
    return _sections;
}

- (void)addSection:(TFFormSectionDescriptor *)formSectionDescriptor; {
    [self.tableDescriptor addSection:formSectionDescriptor.sectionDescriptor];
    [self.sections addObject:formSectionDescriptor];
    formSectionDescriptor.formDescriptor = self;
    [self updateContentVisibility];
}

#pragma mark - TFTableDescriptor delegate

- (void)tableDescriptor:(TFTableDescriptor *)descriptor didSelectRow:(TFRowDescriptor *)rowDescriptor {
    TFFormBaseField *field = (TFFormBaseField *)[descriptor cellForRow:rowDescriptor];
    if ([field isKindOfClass:[TFFormBaseField class]]) {
        [field wasSelected];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableDescriptor scrollToRow:rowDescriptor position:self.selectedFieldScrollPosition animated:YES];
        });
    }
}
- (void)tableDescriptor:(TFTableDescriptor *)descriptor didDeselectRow:(TFRowDescriptor *)rowDescriptor {
    TFFormBaseField *field = (TFFormBaseField *)[descriptor cellForRow:rowDescriptor];
    if ([field isKindOfClass:[TFFormBaseField class]]) {
        [field wasDeselected];
    }
}



#pragma mark - Field value - getters
- (id)valueAtFieldWithTag:(NSString *)tag {
    TFRowDescriptor *rowDescriptor = [self.tableDescriptor rowForTag:tag];
    NSAssert(rowDescriptor != nil, ([NSString stringWithFormat:@"Row with tag %@ not found", tag]));
    
    return [self valueAtField:rowDescriptor.formFieldDescriptor];
}

- (id)valueAtField:(TFFormFieldDescriptor *)fieldDescriptor {
    return fieldDescriptor.value;
}

- (NSDictionary *)allValues {
    
    NSMutableDictionary *mutableDict = [@{} mutableCopy];
    
    for (TFRowDescriptor *rowDescriptor in [self.tableDescriptor allRows]) {
        if (rowDescriptor.tag) {
            id value = [self valueAtField:rowDescriptor.formFieldDescriptor];
            if (value){
                [mutableDict setObject:value forKey:rowDescriptor.tag];
            }
        }
    }
    
    return [mutableDict copy];
}

- (void)updateValueDataAtField:(TFFormFieldDescriptor *)fieldDescriptor{
    TFFormBaseField *field = (TFFormBaseField *)[self.tableDescriptor cellForRow:fieldDescriptor.rowDescriptor];
    if ([field isKindOfClass:[TFFormBaseField class]]) {
        [field updateValueData];
    }
}

#pragma mark Field value - settings
- (void)setValue:(id)value atFieldWithTag:(NSString *)tag{
    TFRowDescriptor *rowDescriptor = [self.tableDescriptor rowForTag:tag];
    NSAssert(rowDescriptor != nil, ([NSString stringWithFormat:@"Row with tag %@ not found", tag]));
    
//    TFFormBaseField *field = (TFFormBaseField *)[self.tableDescriptor cellForRow:rowDescriptor];
    NSAssert(rowDescriptor.formFieldDescriptor != nil, ([NSString stringWithFormat:@"Form field for tag %@ not found", tag]));
    
    return [self setValue:value atField:rowDescriptor.formFieldDescriptor];
}

- (void)setValue:(id)value atField:(TFFormFieldDescriptor *)fieldDescriptor{
    [self setValue:value atRow:fieldDescriptor.rowDescriptor];
}
- (void)setValue:(id)value atRow:(TFRowDescriptor *)rowDescriptor {
//    TFFormBaseField *field = (TFFormBaseField *)[self.tableDescriptor cellForRow:rowDescriptor];
//    NSAssert(field != nil, ([NSString stringWithFormat:@"Form field for tag %@ not found", field.rowDescriptor.tag]));
    
    [rowDescriptor.formFieldDescriptor setValue:value];
    [self updateValueDataAtField:rowDescriptor.formFieldDescriptor];
}


#pragma mark - Actions

- (void)triggerAction:(TFFormAction)formAction forField:(TFFormBaseField *)field{
    if (self.delegate && [self.delegate respondsToSelector:@selector(formDescriptor:didTriggerAction:field:tag:)]) {
        [self.delegate formDescriptor:self didTriggerAction:formAction field:field.rowDescriptor.formFieldDescriptor tag:field.rowDescriptor.tag];
    }
    if (formAction == TFFormActionStateValueDidChange) {
        [self updateContentVisibility];
    }
}


#pragma mark - Visibility

- (void)updateContentVisibility{
    [self.tableDescriptor beginUpdates];
    
    for (TFFormSectionDescriptor *section in self.sections) {
        TFFormSectionDescriptor *formSection = section;
        BOOL hidden = NO;
        if ([section isKindOfClass:[TFFormSectionDescriptor class]] && formSection.displayBlock) {
            hidden = !formSection.displayBlock(self);
        }else hidden = NO;
        [formSection.sectionDescriptor setHidden:hidden withRowAnimation:UITableViewRowAnimationFade];
    }

    for (TFRowDescriptor *row in [self.tableDescriptor allRows]) {
        TFFormFieldDescriptor *fieldDescriptor = row.formFieldDescriptor;
        BOOL hidden = NO;
        if ([fieldDescriptor isKindOfClass:[TFFormFieldDescriptor class]] && fieldDescriptor.displayBlock) {
            hidden = !fieldDescriptor.displayBlock(self);
        }else hidden = NO;
        [row setHidden:hidden withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [self.tableDescriptor endUpdates];
}

#pragma mark - Validations

- (BOOL)isValid{
    BOOL allValid = YES;
    
    for (TFRowDescriptor *field in [self.tableDescriptor allRows]) {
        if (field.formFieldDescriptor && !field.formFieldDescriptor.valid) {
            allValid = NO;
        }
    }
    
    return allValid;
}

- (NSArray *)validationErrors{
    NSMutableArray *errors = [NSMutableArray array];
    
    for (TFRowDescriptor *field in [self.tableDescriptor allRows]) {
        if (field.formFieldDescriptor && !field.formFieldDescriptor.valid) {
            [errors addObjectsFromArray:field.formFieldDescriptor.validationErrors];
        }
    }
    
    return [errors copy];
}

@end




