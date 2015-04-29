//
//  TFFormTitledTextViewField.m
//  Pods
//
//  Created by Radek Doležal on 29.04.15.
//
//

#import "TFFormTitledTextViewField.h"

@implementation TFFormTitledTextViewField

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title placeholder:(NSString *)placeholder value:(NSString *)value {
    
    return [TFRowConfiguration configurationWithBlock:^(TFFormTitledTextViewField *configuration) {
        configuration.titleLabel.text = title;
        if(placeholder) {
            configuration.textView.placeholder = placeholder;
        }
        if(value){
            configuration.textView.text = value;
        }
    }];
    
}

- (void)setValue:(id)value {
    
    if ([value isKindOfClass:[NSString class]]) {
        self.textView.text = value;
    }
}

- (id)value {
    return self.textView.text;
}


#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self triggerAction:TFFormActionTextViewDidBeginEditing];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [self triggerAction:TFFormActionTextViewDidEndEditing];
}

- (void)textViewDidChange:(UITextView *)textView{
    [self triggerAction:TFFormActionStateValueDidChange];
}

#pragma mark - UIAppearance

- (void)setTextViewFont:(UIFont *)font {
    self.textView.font = font;
}

- (void)setTextViewTextColor:(UIColor *)textColor {
    self.textView.textColor = textColor;
}

- (void)setTextViewTextAlignment:(NSTextAlignment)textAlignment {
    self.textView.textAlignment = textAlignment;
}

- (void)setTextViewPlaceholderAttributes:(NSDictionary *)placeholderAttributes {
    if(self.textView.placeholder) {
        self.textView.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.textView.placeholder attributes:placeholderAttributes];
    }
}


@end
