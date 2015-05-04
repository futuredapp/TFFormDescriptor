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

- (void)setTitleLabelFont:(UIFont *)font {
    self.titleLabel.font = font;
}

- (void)setTitleLabelTextColor:(UIColor *)color {
    self.titleLabel.textColor = color;
}

- (void)setTitleLabelTextAlignment:(NSTextAlignment)textAlignment {
    self.titleLabel.textAlignment = textAlignment;
}

- (void)setTitleLabelMargin:(CGFloat)margin {
    if([self.titleLabel.text length] > 0) {
        self.titleMargin.constant = margin;
    }
}

- (void)configureAppearance:(TFFormGlobalAppearance *)appearance {
    
    if (appearance.defaultFont) {
        [self.titleLabel setFont:appearance.defaultFont];
    }
    
}

@end
