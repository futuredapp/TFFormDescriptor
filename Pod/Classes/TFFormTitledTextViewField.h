//
//  TFFormTitledTextViewField.h
//  Pods
//
//  Created by Radek Doležal on 29.04.15.
//
//

#import <UIKit/UIKit.h>
#import "TFFormTitledBaseField.h"
#import <SAMTextView.h>

typedef NS_ENUM(TFFormAction, TFFormActionTextView) {
    TFFormActionTextViewDidBeginEditing,
    TFFormActionTextViewDidEndEditing
};

@interface TFFormTitledTextViewField : TFFormTitledBaseField <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet SAMTextView *textView;

+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title placeholder:(NSString *)placeholder value:(NSString *)value;

- (void)setTextViewFont:(UIFont *)font UI_APPEARANCE_SELECTOR;
- (void)setTextViewTextColor:(UIColor *)textColor UI_APPEARANCE_SELECTOR;
- (void)setTextViewTextAlignment:(NSTextAlignment)textAlignment UI_APPEARANCE_SELECTOR;
- (void)setTextViewPlaceholderAttributes:(NSDictionary *)placeholderAttributes UI_APPEARANCE_SELECTOR;


@end
