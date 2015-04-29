//
//  TFTextFieldCell.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormTitledTextField.h"

@interface TFFormTitledTextField ()

@property (strong, nonatomic) NSMutableString *textFieldValue;

@end

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
        if(placeholder) {
            configuration.textField.placeholder = placeholder;
        }
        if(value){
            configuration.textFieldValue = [[NSMutableString alloc] initWithString:value];
        } else {
            configuration.textFieldValue = [NSMutableString string];
        }
    }];
    
}

- (void)setTextFieldValue:(NSMutableString *)textFieldValue{
    _textFieldValue = textFieldValue;
    self.textField.text = textFieldValue;
}

- (void)setValue:(id)value {
    
    if ([value isKindOfClass:[NSString class]]) {
        self.textFieldValue = [[NSMutableString alloc] initWithString:value];
    }
}

- (id)value {
    return self.textFieldValue;
}

+ (NSNumber *)height {
    return @40;
}

- (IBAction)valueDidChange:(id)sender {
    [self triggerAction:TFFormActionStateValueDidChange];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self triggerAction:TFFormActionTextFieldDidBeginEditing];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self triggerAction:TFFormActionTextFieldDidEndEditing];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    [self.textFieldValue replaceCharactersInRange:range withString:string];
    [self triggerAction:TFFormActionStateValueDidChange];
    return YES;
}

#pragma mark - UIAppearance

- (void)setTextFieldFont:(UIFont *)font {
    self.textField.font = font;
}

- (void)setTextFieldTextColor:(UIColor *)textColor {
    self.textField.textColor = textColor;
}

- (void)setTextFieldTextAlignment:(NSTextAlignment)textAlignment {
    self.textField.textAlignment = textAlignment;
}

- (void)setTextFieldBorderStyle:(UITextBorderStyle)borderStyle {
    self.textField.borderStyle = borderStyle;
}

- (void)setTextFieldPlaceholderAttributes:(NSDictionary *)placeholderAttributes {
    if(self.textField.placeholder) {
        self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.textField.placeholder attributes:placeholderAttributes];
    }
}

@end
