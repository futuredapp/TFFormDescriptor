//
//  TFFormTitledBaseCell.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormTitledBaseField.h"

@implementation TFFormTitledBaseField


#pragma mark - UIAppearance

- (void)setTitleLabelFont:(UIFont *)font UI_APPEARANCE_SELECTOR {
    self.titleLabel.font = font;
}

- (void)setTitleLabelTextColor:(UIColor *)color UI_APPEARANCE_SELECTOR{
    self.titleLabel.textColor = color;
}

- (void)setTitleLabelTextAlignment:(NSTextAlignment)textAlignment UI_APPEARANCE_SELECTOR{
    self.titleLabel.textAlignment = textAlignment;
}

- (void)configureAppearance:(TFFormGlobalAppearance *)appearance {
    
    if (appearance.defaultFont) {
        [self.titleLabel setFont:appearance.defaultFont];
    }
    
}

@end
