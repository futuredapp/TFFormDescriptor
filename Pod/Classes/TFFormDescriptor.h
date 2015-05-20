//
//  TFFormDescriptor.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormFieldDescriptor.h"
#import "TFFormSectionDescriptor.h"

// Fields
#import "TFFormTitledTextField.h"
#import "TFFormTitledSwitchField.h"
#import "TFFormTitledTextViewField.h"

@class TFFormDescriptor;

@protocol TFFormDescriptorDelegate <NSObject>

- (void)formDescriptor:(TFFormDescriptor *)formDescriptor didTriggerAction:(TFFormAction)formAction field:(TFFormFieldDescriptor *)field tag:(NSString *)tag;

@end


@interface TFFormDescriptor : NSObject

@property (nonatomic) UITableViewScrollPosition selectedFieldScrollPosition;

@property (assign, nonatomic) id<TFFormDescriptorDelegate> delegate;

#pragma mark - Inicialization

+ (instancetype)descriptorWithTable:(UITableView *)tableView;

- (instancetype)initWithTable:(UITableView *)tableView;

#pragma mark - Adding sections

- (void)addSection:(TFFormSectionDescriptor *)formSectionDescriptor;

#pragma mark - Field values

- (id)valueAtFieldWithTag:(NSString *)tag;
- (id)valueAtField:(TFFormFieldDescriptor *)fieldDescriptor;

- (void)setValue:(id)value atFieldWithTag:(NSString *)tag;
- (void)setValue:(id)value atField:(TFFormFieldDescriptor *)fieldDescriptor;

/// Values in dictionary where key is row tag
- (NSDictionary *)allValues;

- (void)updateValueDataAtField:(TFFormFieldDescriptor *)fieldDescriptor;

#pragma mark - Actions

- (void)triggerAction:(TFFormAction)formAction forField:(TFFormBaseField *)field;

#pragma mark - Visibility

- (void)updateContentVisibility;


#pragma mark - Validations

@property (readonly, nonatomic, getter=isValid) BOOL valid;

@property (readonly, nonatomic) NSArray *validationErrors;


@end
