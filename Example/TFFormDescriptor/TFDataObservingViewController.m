//
//  TFDataObservingViewController.m
//  TFFormDescriptor
//
//  Created by Jakub Knejzlik on 01/05/15.
//  Copyright (c) 2015 Ales Kocur. All rights reserved.
//

#import "TFDataObservingViewController.h"

#import "TFDataObservingFormDescriptor.h"

@interface TFDataObservingViewController ()
@property TFDataObservingFormDescriptor *formDescriptor;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *data;
@end

@implementation TFDataObservingViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.data = [@{@"name":@"name",@"hasCar":@NO} mutableCopy];
    
    TFDataObservingFormDescriptor *form = [TFDataObservingFormDescriptor descriptorWithTable:self.tableView];
    
    TFFormSectionDescriptor *section = [TFFormSectionDescriptor descriptorWithTag:0 data:nil];
    
    TFFormFieldDescriptor *textField = [TFFormFieldDescriptor descriptorWithClass:[TFFormTitledTextField class] configuration:[TFFormTitledTextField configurationWithTitle:@"Name" placeholder:@"Your name" value:@"Alonso"] tag:@"name"];
    
    [section addRow:textField];
    
    TFFormFieldDescriptor *hasCarField = [TFFormFieldDescriptor descriptorWithClass:[TFFormTitledSwitchField class] configuration:[TFFormTitledSwitchField configurationWithTitle:@"Do You have car?" value:NO] tag:@"hasCar"];
    
    [section addRow:hasCarField];
    
    
    textField = [TFFormFieldDescriptor descriptorWithClass:[TFFormTitledTextField class] configuration:[TFFormTitledTextField configurationWithTitle:@"Car brand" placeholder:@"fiat, seat, audi, kia, hyundai" value:nil] tag:@"carBrand"];
    
    [textField setDisplayBlock:^BOOL(TFFormDescriptor *formDescriptor) {
        NSLog(@"%i",[[hasCarField value] boolValue]);
        return [[hasCarField value] boolValue];
    }];
    
    [section addRow:textField];
    
    
    [form addSection:section];
    
    self.formDescriptor = form;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.formDescriptor setData:self.data];
}

- (IBAction)resetData:(id)sender {
    self.data[@"name"] = @"name";
    self.data[@"hasCar"] = @NO;
}

@end
