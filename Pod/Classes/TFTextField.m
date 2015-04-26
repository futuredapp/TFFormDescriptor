//
//  TFTextFieldCell.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFTextField.h"

@implementation TFTextField


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}

+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title placeholder:(NSString *)placeholder value:(NSString *)value {
    
    return [TFRowConfiguration configuration:^(TFTextField *configuration) {
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


@end
