//
//  TFViewController.m
//  TFFormDescriptor
//
//  Created by Ales Kocur on 04/24/2015.
//  Copyright (c) 2014 Ales Kocur. All rights reserved.
//

#import "TFViewController.h"
#import <TFFormDescriptor.h>

@interface TFViewController ()

@property TFFormDescriptor *formDescriptor;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TFFormDescriptor *form = [TFFormDescriptor descriptorWithTable:self.tableView];
    
    TFFormSectionDescriptor *section = [TFFormSectionDescriptor descriptorWithTag:0 data:nil];
    
    TFFormRowDescriptor *textField = [TFFormRowDescriptor descriptorWithClass:[TFTextField class] configuration:[TFTextField configurationWithTitle:@"Name" placeholder:@"Your name" value:@"Alonso"] tag:@"TextFieldTag"];
    
    [section addRow:textField];
    [form addSection:section];
    
    self.formDescriptor = form;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
