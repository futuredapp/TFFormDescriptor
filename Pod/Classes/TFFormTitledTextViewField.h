//
//  TFFormTitledTextViewField.h
//  Pods
//
//  Created by Radek Doležal on 29.04.15.
//
//

#import <UIKit/UIKit.h>
#import "TFFormTitledBaseField.h"
#import <EAMTextView.h>

typedef NS_ENUM(TFFormAction, TFFormActionTextView) {
    TFFormActionTextViewDidBeginEditing,
    TFFormActionTextViewDidEndEditing
};

@interface TFFormTitledTextViewField : TFFormTitledBaseField <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet EAMTextView *textView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textViewHeightConstraint;


+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title placeholder:(NSString *)placeholder;

- (void)setTextViewFont:(UIFont *)font UI_APPEARANCE_SELECTOR;
- (void)setTextViewTextColor:(UIColor *)textColor UI_APPEARANCE_SELECTOR;
- (void)setTextViewTextAlignment:(NSTextAlignment)textAlignment UI_APPEARANCE_SELECTOR;
- (void)setTextViewBackgroundColor:(UIColor *)backgroundColor UI_APPEARANCE_SELECTOR;
- (void)setTextViewPlaceholderColor:(UIColor *)placeholderColor UI_APPEARANCE_SELECTOR;
- (void)setTextViewTintColor:(UIColor *)tintColor UI_APPEARANCE_SELECTOR;

@end
