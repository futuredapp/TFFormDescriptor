//
//  TFFormDescriptor.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormRowDescriptor.h"
#import "TFFormSectionDescriptor.h"

// Fields
#import "TFTextField.h"

@class TFFormDescriptor;

@protocol TFFormDescriptorDelegate <NSObject>

- (void)formDescriptor:(TFFormDescriptor *)formDescriptor didTriggerAction:(TFRowAction *)rowAction;

@end

@interface TFFormDescriptor : NSObject

@property (assign, nonatomic) id<TFFormDescriptorDelegate> delegate;

#pragma mark - Inicialization

+ (instancetype)descriptorWithTable:(UITableView *)tableView;

#pragma mark - Adding sections

- (void)addSection:(TFFormSectionDescriptor *)formSectionDescriptor;

@end
