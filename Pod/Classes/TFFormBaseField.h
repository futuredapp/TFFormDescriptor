//
//  TFFormBasicCell.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFBasicDescriptedCell.h"
#import "TFRowConfiguration.h"
#import "TFFormFieldDescriptor.h"
#import "TFFormGlobalAppearance.h"

typedef NSInteger TFFormAction;

typedef NS_ENUM(TFFormAction, TFFormActionState) {
    TFFormActionStateValueDidChange = 10000
};

@protocol TFFormBaseCellProtocol <NSObject>

- (void)setValue:(id)value;
- (id)value;
- (void)configureAppearance:(TFFormGlobalAppearance *)appearance;

@end

@interface TFFormBaseField : TFBasicDescriptedCell<TFFormBaseCellProtocol>

- (void)triggerAction:(TFFormAction)formAction;

- (void)setBackgroundColor:(UIColor *)backgroundColor UI_APPEARANCE_SELECTOR;

@end
