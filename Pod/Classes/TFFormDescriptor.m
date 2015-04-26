//
//  TFFormDescriptor.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormDescriptor.h"
#import "TFTableDescriptor.h"
#import "TFFormBasicCell.h"


@interface TFFormDescriptor ()<TFTableDescriptorDelegate>

@property (strong, nonatomic) TFTableDescriptor *tableDescriptor;

@end

@implementation TFFormDescriptor

+ (instancetype)descriptorWithTable:(UITableView *)tableView {
    
    TFFormDescriptor *formDescriptor = [[TFFormDescriptor alloc] init];
    
    formDescriptor.tableDescriptor = [TFTableDescriptor descriptorWithTable:tableView];
    formDescriptor.tableDescriptor.delegate = formDescriptor;
    [formDescriptor registerDefaultFormClasses];
    
    return formDescriptor;
}

- (void)registerDefaultFormClasses {
    for (Class c in [TFFormDescriptor defaultFormsClasses]) {
        REGISTER_CELL_FOR_TABLE(c, self.tableDescriptor.tableView);
    }
}

+ (NSArray *)defaultFormsClasses {
    return @[[TFTextField class]];
}

#pragma mark - Adding sections and rows

- (void)addSection:(TFFormSectionDescriptor *)formSectionDescriptor; {
    [self.tableDescriptor addSection:formSectionDescriptor.sectionDescriptor];
}

#pragma mark - TFTableDescriptor delegate

- (void)tableDescriptor:(TFTableDescriptor *)descriptor didSelectRow:(TFRowDescriptor *)rowDescriptor {
    
}

@end
