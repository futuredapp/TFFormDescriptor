//
//  TFFormTitleSwitchField.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormTitledSwitchField.h"

@implementation TFFormTitledSwitchField

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title value:(BOOL)value {
    return [TFRowConfiguration configurationWithBlock:^(TFFormTitledSwitchField *configuration) {
        configuration.titleLabel.text = title;
        configuration.switchControl.on = value;
    }];
}

- (void)setValue:(id)value {
    
    if ([value isKindOfClass:[NSNumber class]]) {
        self.switchControl.on = [value boolValue];
    }
}

- (id)value {
    return @(self.switchControl.on);
}

+ (NSNumber *)height {
    
    return @44;
}

- (IBAction)valueDidChange:(id)sender {
    [self triggerAction:TFFormActionStateValueDidChange];
}

#pragma mark - UIAppearance

- (void)setSwitchTintColor:(UIColor *)color {
    [self.switchControl setTintColor:color];
}

- (void)setSwitchOnTintColor:(UIColor *)color {
    [self.switchControl setOnTintColor:color];
}

- (void)setSwitchThumbTintColor:(UIColor *)color {
    [self.switchControl setThumbTintColor:color];
}

@end
