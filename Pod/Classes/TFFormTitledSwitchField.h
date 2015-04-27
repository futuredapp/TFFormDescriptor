//
//  TFFormTitleSwitchField.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import <UIKit/UIKit.h>
#import "TFFormTitledBaseField.h"

typedef NS_ENUM(TFFormAction, TFFormActionSwitch) {
    TFFormActionSwitchTRLALA
};

@interface TFFormTitledSwitchField : TFFormTitledBaseField

@property (strong, nonatomic) IBOutlet UISwitch *switchControl;

+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title value:(BOOL)value;

#pragma mark - UIAppearance

- (void)setSwitchTintColor:(UIColor *)color UI_APPEARANCE_SELECTOR;
- (void)setSwitchOnTintColor:(UIColor *)color UI_APPEARANCE_SELECTOR;

@end
