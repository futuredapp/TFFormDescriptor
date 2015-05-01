//
//  TFViewController.m
//  TFFormDescriptor
//
//  Created by Ales Kocur on 04/24/2015.
//  Copyright (c) 2014 Ales Kocur. All rights reserved.
//

#import "TFViewController.h"
#import <TFFormDescriptor.h>

static NSString * const kFieldTagTextField = @"TextFieldTag";
static NSString * const kFieldTagSwitch = @"SwitchFieldTag";

@interface TFViewController ()<TFFormDescriptorDelegate>

@property TFFormDescriptor *formDescriptor;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TFFormDescriptor *form = [TFFormDescriptor descriptorWithTable:self.tableView];
    
    TFFormSectionDescriptor *section = [TFFormSectionDescriptor descriptorWithTag:0 data:nil];
    
    TFFormFieldDescriptor *textField = [TFFormFieldDescriptor descriptorWithClass:[TFFormTitledTextField class] configuration:[TFFormTitledTextField configurationWithTitle:@"Name" placeholder:@"Your name" value:@"Alonso"] tag:kFieldTagTextField];
    
    [section addRow:textField];
    
    
    for (int x = 0; x<20; x++) {
        textField = [TFFormFieldDescriptor descriptorWithClass:[TFFormTitledTextField class] configuration:[TFFormTitledTextField configurationWithTitle:@"Name" placeholder:@"Your name" value:@"Alonso"] tag:[NSString stringWithFormat:@"aaa%i",x]];
        
        [section addRow:textField];
    }
    
    
    TFFormFieldDescriptor *switchField = [TFFormFieldDescriptor descriptorWithClass:[TFFormTitledSwitchField class] configuration:[TFFormTitledSwitchField configurationWithTitle:@"Are you sure?" value:YES] tag:kFieldTagSwitch];
    
    [section addRow:switchField];
    
    [form addSection:section];
    
    self.formDescriptor = form;
    
    self.formDescriptor.delegate = self;
    
}

- (IBAction)printValues:(id)sender {

    NSLog(@"%@", [self.formDescriptor allValues]);

}

#pragma mark - TFFormDescriptor delegate

- (void)formDescriptor:(TFFormDescriptor *)formDescriptor didTriggerAction:(TFFormAction)formAction field:(TFFormFieldDescriptor *)field tag:(NSString *)tag {
    
    if (formAction == TFFormActionStateValueDidChange) {
        
        if ([tag isEqualToString:kFieldTagSwitch]) {
            NSLog(@"Value did change: %@", [self.formDescriptor valueAtField:field]);
        }
    } else if (formAction == TFFormActionSwitchTRLALA) {
        
    }
    
}


@end
