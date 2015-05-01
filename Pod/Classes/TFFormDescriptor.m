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

@end

@implementation TFFormDescriptor

+ (instancetype)descriptorWithTable:(UITableView *)tableView {
    
    TFFormDescriptor *formDescriptor = [[TFFormDescriptor alloc] init];
    
    formDescriptor.tableDescriptor = [TFTableDescriptor descriptorWithTable:tableView];
    formDescriptor.tableDescriptor.delegate = formDescriptor;
    formDescriptor.tableDescriptor.formDescriptor = formDescriptor;
    [formDescriptor registerDefaultFormClasses];
    
    return formDescriptor;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)registerDefaultFormClasses {
    for (Class c in [TFFormDescriptor defaultFormsClasses]) {
        REGISTER_CELL_FOR_TABLE(c, self.tableDescriptor.tableView);
    }
}

+ (NSArray *)defaultFormsClasses {
    return @[[TFFormTitledTextField class], [TFFormTitledSwitchField class]];
}

#pragma mark - Adding sections and rows


- (void)addSection:(TFFormSectionDescriptor *)formSectionDescriptor; {
    [self.tableDescriptor addSection:formSectionDescriptor.sectionDescriptor];
    formSectionDescriptor.formDescriptor = self;
    [self updateContentVisibility];
}

#pragma mark - TFTableDescriptor delegate

- (void)tableDescriptor:(TFTableDescriptor *)descriptor didSelectRow:(TFRowDescriptor *)rowDescriptor {

}



#pragma mark - Field value - getters
- (id)valueAtFieldWithTag:(NSString *)tag {
    TFRowDescriptor *rowDescriptor = [self.tableDescriptor rowForTag:tag];
    NSAssert(rowDescriptor != nil, ([NSString stringWithFormat:@"Row with tag %@ not found", tag]));
    
    
//    TFFormBaseField *field = (TFFormBaseField *)[self.tableDescriptor cellForRow:rowDescriptor];
//    NSAssert(rowDescriptor.formRowDescriptor != nil, ([NSString stringWithFormat:@"Form field for tag %@ not found", tag]));
    
    return [self valueAtField:rowDescriptor.formRowDescriptor];
}

- (id)valueAtField:(TFFormFieldDescriptor *)fieldDescriptor {
    return [self valueAtRow:fieldDescriptor.rowDescriptor];
}

- (id)valueAtRow:(TFRowDescriptor *)rowDescriptor {
    TFFormBaseField *field = (TFFormBaseField *)[self.tableDescriptor cellForRow:rowDescriptor];
// check disabled, has connection with this issue https://github.com/thefuntasty/TFFormDescriptor/issues/2
//    NSAssert(field != nil, ([NSString stringWithFormat:@"Form field for tag %@ not found", field.rowDescriptor.tag]));
    
    return [field value];
}

- (NSDictionary *)allValues {
    
    NSMutableDictionary *mutableDict = [@{} mutableCopy];
    
    for (TFRowDescriptor *rowDescriptor in [self.tableDescriptor allRows]) {
        [mutableDict setObject:[self valueAtRow:rowDescriptor] forKey:rowDescriptor.tag];
    }
    
    return [mutableDict copy];
}

#pragma mark Field value - settings
- (void)setValue:(id)value atFieldWithTag:(NSString *)tag{
    TFRowDescriptor *rowDescriptor = [self.tableDescriptor rowForTag:tag];
    NSAssert(rowDescriptor != nil, ([NSString stringWithFormat:@"Row with tag %@ not found", tag]));
    
//    TFFormBaseField *field = (TFFormBaseField *)[self.tableDescriptor cellForRow:rowDescriptor];
    NSAssert(rowDescriptor.formRowDescriptor != nil, ([NSString stringWithFormat:@"Form field for tag %@ not found", tag]));
    
    return [self setValue:value atField:rowDescriptor.formRowDescriptor];
}

- (void)setValue:(id)value atField:(TFFormFieldDescriptor *)fieldDescriptor{
    [self setValue:value atRow:fieldDescriptor.rowDescriptor];
}
- (void)setValue:(id)value atRow:(TFRowDescriptor *)rowDescriptor {
    TFFormBaseField *field = (TFFormBaseField *)[self.tableDescriptor cellForRow:rowDescriptor];
    NSAssert(field != nil, ([NSString stringWithFormat:@"Form field for tag %@ not found", field.rowDescriptor.tag]));
    
    [field setValue:value];
}

#pragma mark - Actions

- (void)triggerAction:(TFFormAction)formAction forField:(TFFormBaseField *)field{
    if (self.delegate && [self.delegate respondsToSelector:@selector(formDescriptor:didTriggerAction:field:tag:)]) {
        [self.delegate formDescriptor:self didTriggerAction:formAction field:field.rowDescriptor.formRowDescriptor tag:field.rowDescriptor.tag];
    }
    if (formAction == TFFormActionStateValueDidChange) {
        [self updateContentVisibility];
    }
}


#pragma mark - Visibility

- (void)updateContentVisibility{
    [self.tableDescriptor beginUpdates];
    
    for (TFSectionDescriptor *section in [self.tableDescriptor allSections]) {
        TFFormSectionDescriptor *formSection = section.formSectionDescriptor;
        if ([section isKindOfClass:[TFFormSectionDescriptor class]] && formSection.displayBlock) {
            formSection.sectionDescriptor.hidden = !formSection.displayBlock(self);
        }else formSection.sectionDescriptor.hidden = NO;
    }

    for (TFRowDescriptor *row in [self.tableDescriptor allRows]) {
        TFFormFieldDescriptor *fieldDescriptor = row.formRowDescriptor;
        if ([fieldDescriptor isKindOfClass:[TFFormFieldDescriptor class]] && fieldDescriptor.displayBlock) {
            row.hidden = !fieldDescriptor.displayBlock(self);
        }else row.hidden = NO;
    }
    
    [self.tableDescriptor endUpdates];
}

@end




