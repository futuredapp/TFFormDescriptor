//
//  TFTextFieldCell.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import <UIKit/UIKit.h>
#import "TFFormTitledBaseField.h"

typedef NS_ENUM(TFFormAction, TFFormActionTextField) {
    TFFormActionTextFieldDidBeginEditing,
    TFFormActionTextFieldDidEndEditing
};

@interface TFFormTitledTextField : TFFormTitledBaseField <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;

+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title placeholder:(NSString *)placeholder;

- (void)setTextFieldFont:(UIFont *)font UI_APPEARANCE_SELECTOR;
- (void)setTextFieldTextColor:(UIColor *)textColor UI_APPEARANCE_SELECTOR;
- (void)setTextFieldTextAlignment:(NSTextAlignment)textAlignment UI_APPEARANCE_SELECTOR;
- (void)setTextFieldBorderStyle:(UITextBorderStyle)borderStyle UI_APPEARANCE_SELECTOR;
- (void)setTextFieldPlaceholderAttributes:(NSDictionary *)placeholderAttributes UI_APPEARANCE_SELECTOR;

@end
