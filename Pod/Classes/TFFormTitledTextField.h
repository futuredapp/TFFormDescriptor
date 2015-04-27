//
//  TFTextFieldCell.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import <UIKit/UIKit.h>
#import "TFFormTitledBaseField.h"

@interface TFFormTitledTextField : TFFormTitledBaseField

@property (strong, nonatomic) IBOutlet UITextField *textField;

+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title placeholder:(NSString *)placeholder value:(NSString *)value;

- (void)setTextFieldFont:(UIFont *)font UI_APPEARANCE_SELECTOR;
- (void)setTextFieldTextColor:(UIColor *)textColor UI_APPEARANCE_SELECTOR;
- (void)setTextFieldTextAlignment:(NSTextAlignment)textAlignment UI_APPEARANCE_SELECTOR;
- (void)setTextFieldBorderStyle:(UITextBorderStyle)borderStyle UI_APPEARANCE_SELECTOR;


@end
