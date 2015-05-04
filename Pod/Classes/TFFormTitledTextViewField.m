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
        if([configuration.titleLabel.text length] == 0) {
            configuration.titleMargin.constant = 0;
        }
        if(placeholder) {
            configuration.textView.placeholder = placeholder;
        }
        if(value){
            configuration.textView.text = value;
        }
       
        /*
        configuration.textViewHeightConstraint.constant = configuration.textView.contentSize.height;
        [configuration setNeedsUpdateConstraints];
        */
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

+ (NSNumber *)height {
    
    return @90;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self triggerAction:TFFormActionTextViewDidBeginEditing];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [self triggerAction:TFFormActionTextViewDidEndEditing];
}

- (void)textViewDidChange:(UITextView *)textView{
    /*
    if(self.textViewHeightConstraint.constant < self.textView.contentSize.height) {
        self.textViewHeightConstraint.constant = self.textView.contentSize.height;
        [self setNeedsUpdateConstraints];
        
    }
    */
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

- (void)setTextViewBackgroundColor:(UIColor *)backgroundColor {
    self.textView.backgroundColor = backgroundColor;
}

- (void)setTextViewPlaceholderColor:(UIColor *)placeholderColor{
    self.textView.placeholderColor = placeholderColor;
}

- (void)setTextViewTintColor:(UIColor *)tintColor{
    self.textView.tintColor = tintColor;
}


@end
