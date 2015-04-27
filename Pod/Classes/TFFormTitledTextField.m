//
//  TFTextFieldCell.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormTitledTextField.h"

@implementation TFFormTitledTextField


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title placeholder:(NSString *)placeholder value:(NSString *)value {
    
    return [TFRowConfiguration configurationWithBlock:^(TFFormTitledTextField *configuration) {
        configuration.titleLabel.text = title;
        configuration.textField.placeholder = placeholder;
        configuration.textField.text = value;
    }];
    
}

- (void)setValue:(id)value {
    
    if ([value isKindOfClass:[NSString class]]) {
        self.textField.text = value;
    }
}

- (id)value {
    return self.textField.text;
}

+ (NSNumber *)height {
    return @40;
}

- (IBAction)valueDidChange:(id)sender {
    [self triggerAction:TFFormActionStateValueDidChange];
}


- (void)setTextFieldFont:(UIFont *)font UI_APPEARANCE_SELECTOR{
    self.textField.font = font;
}

- (void)setTextFieldTextColor:(UIColor *)textColor UI_APPEARANCE_SELECTOR{
    self.textField.textColor = textColor;
}

- (void)setTextFieldTextAlignment:(NSTextAlignment)textAlignment UI_APPEARANCE_SELECTOR{
    self.textField.textAlignment = textAlignment;
}

- (void)setTextFieldBorderStyle:(UITextBorderStyle)borderStyle UI_APPEARANCE_SELECTOR{
    self.textField.borderStyle = borderStyle;
}

@end
