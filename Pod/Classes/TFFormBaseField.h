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

- (void)updateValueData;
- (void)configureAppearance:(TFFormGlobalAppearance *)appearance;

@end

@interface TFFormBaseField : TFBasicDescriptedCell<TFFormBaseCellProtocol>
@property (strong, nonatomic) id valueData;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leftPadding;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightPadding;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topPadding;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomPadding;

- (void)triggerAction:(TFFormAction)formAction;

- (void)setBackgroundColor:(UIColor *)backgroundColor UI_APPEARANCE_SELECTOR;
- (void)setContentPadding:(UIEdgeInsets)contentPadding UI_APPEARANCE_SELECTOR;

@end
