//
//  TFFormTitledBaseCell.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormTitledBaseField.h"

@implementation TFFormTitledBaseField

- (void)setTitleLabelFont:(UIFont *)font UI_APPEARANCE_SELECTOR {
    self.titleLabel.font = font;
}

- (void)configureAppearance:(TFFormGlobalAppearance *)appearance {
    
    if (appearance.defaultFont) {
        [self.titleLabel setFont:appearance.defaultFont];
    }
    
}

@end
