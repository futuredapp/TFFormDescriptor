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
static NSString * const kFieldTagTextView = @"TextViewFieldTag";

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
    
    
    TFFormFieldDescriptor *textField = [TFFormFieldDescriptor descriptorWithClass:[TFFormTitledTextField class] configuration:[TFFormTitledTextField configurationWithTitle:@"Name" placeholder:@"Your name"] tag:kFieldTagTextField];
    
    [section addRow:textField];
    
    
    for (int x = 0; x<20; x++) {
        textField = [TFFormFieldDescriptor descriptorWithClass:[TFFormTitledTextField class] configuration:[TFFormTitledTextField configurationWithTitle:@"Name" placeholder:@"Your name"] tag:[NSString stringWithFormat:@"aaa%i",x]];
        
        [section addRow:textField];
    }
    
    
    TFFormFieldDescriptor *switchField = [TFFormFieldDescriptor descriptorWithClass:[TFFormTitledSwitchField class] configuration:[TFFormTitledSwitchField configurationWithTitle:@"Are you sure?"] tag:kFieldTagSwitch];
    
    [section addRow:switchField];

    TFFormFieldDescriptor *textViewField = [TFFormFieldDescriptor descriptorWithClass:[TFFormTitledTextViewField class] configuration:[TFFormTitledTextViewField configurationWithTitle:@"Title" placeholder:@"Text view"] tag:kFieldTagTextView];
    
    [section addRow:textViewField];
    
    [form addSection:section];
    
    self.formDescriptor = form;
    
    self.formDescriptor.delegate = self;
    
}

- (IBAction)printValues:(id)sender {
    //[self.view endEditing:YES];
    NSLog(@"%@", [self.formDescriptor allValues]);

}

#pragma mark - TFFormDescriptor delegate

- (void)formDescriptor:(TFFormDescriptor *)formDescriptor didTriggerAction:(TFFormAction)formAction field:(TFFormFieldDescriptor *)field tag:(NSString *)tag {
    
    if (formAction == TFFormActionStateValueDidChange) {
        if ([tag isEqualToString:kFieldTagSwitch]) {
            NSLog(@"Value did change: %@", [self.formDescriptor valueAtField:field]);
        } else if ([tag isEqualToString:kFieldTagTextField]) {
            NSLog(@"Value is: %@", [self.formDescriptor valueAtField:field]);
        } else if ([tag isEqualToString:kFieldTagTextView]) {
        //    NSLog(@"Value is: %@", [self.formDescriptor valueAtField:field]);
        }
        
    } else if (formAction == TFFormActionTextFieldDidBeginEditing) {
        NSLog(@"Did begin editing");
    } else if (formAction == TFFormActionTextFieldDidEndEditing) {
        NSLog(@"Did end editing, value: %@", [self.formDescriptor valueAtField:field]);
    } else if (formAction == TFFormActionTextViewDidBeginEditing) {
        NSLog(@"Did begin editing");
    } else if (formAction == TFFormActionTextViewDidEndEditing) {
        NSLog(@"Did end editing, value: %@", [self.formDescriptor valueAtField:field]);
    }

}


@end
