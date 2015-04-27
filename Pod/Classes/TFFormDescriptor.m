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
}

#pragma mark - TFTableDescriptor delegate

- (void)tableDescriptor:(TFTableDescriptor *)descriptor didSelectRow:(TFRowDescriptor *)rowDescriptor {
    
}



#pragma mark - Getting value

- (id)valueAtFieldWithTag:(NSString *)tag {
    TFRowDescriptor *rowDescriptor = [self.tableDescriptor rowForTag:tag];
    NSAssert(rowDescriptor != nil, ([NSString stringWithFormat:@"Row with tag %@ not found", tag]));
    
    TFFormBaseField *field = (TFFormBaseField *)[self.tableDescriptor cellForRow:rowDescriptor];
    NSAssert(field != nil, ([NSString stringWithFormat:@"Form field for tag %@ not found", tag]));
    
    return [field value];
}

- (id)valueAtField:(TFFormFieldDescriptor *)fieldDescriptor {
    return [self valueAtRow:fieldDescriptor.rowDescriptor];
}

- (id)valueAtRow:(TFRowDescriptor *)rowDescriptor {
    TFFormBaseField *field = (TFFormBaseField *)[self.tableDescriptor cellForRow:rowDescriptor];
    NSAssert(field != nil, ([NSString stringWithFormat:@"Form field for tag %@ not found", field.rowDescriptor.tag]));
    
    return [field value];
}

- (NSDictionary *)allValues {
    
    NSMutableDictionary *mutableDict = [@{} mutableCopy];
    
    for (TFRowDescriptor *rowDescriptor in [self.tableDescriptor allRows]) {
        [mutableDict setObject:[self valueAtRow:rowDescriptor] forKey:rowDescriptor.tag];
    }
    
    return [mutableDict copy];
}

@end




