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


+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title placeholder:(NSString *)placeholder{
    
    return [TFRowConfiguration configurationWithBlock:^(TFFormTitledTextField *configuration) {
        configuration.textField.userInteractionEnabled = NO;
        configuration.titleLabel.text = title;
        if([configuration.titleLabel.text length] == 0) {
            configuration.titleMargin.constant = 0;
        }
        
        if(placeholder) {
            configuration.textField.placeholder = placeholder;
        }
    }];
    
}

- (void)setTextFieldValue:(NSMutableString *)textFieldValue{
    _textFieldValue = textFieldValue;
    if(textFieldValue){
        self.textField.text = [[NSMutableString alloc] initWithString:textFieldValue];
    } else {
        self.textField.text = [NSMutableString string];
    }
}

- (void)updateValueData{
    if ([self.valueData isKindOfClass:[NSString class]]) {
        self.textFieldValue = [[NSMutableString alloc] initWithString:self.valueData];
    }
}

- (void)wasSelected{
    self.textField.userInteractionEnabled = YES;
    [self.textField becomeFirstResponder];
}

- (void)wasDeselected{
    self.textField.userInteractionEnabled = NO;
    [self.textField resignFirstResponder];
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
    self.valueData = [textField.text stringByReplacingCharactersInRange:range withString:string];
//    [self.textFieldValue replaceCharactersInRange:range withString:string];
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
