//
//  TFFormTitledBaseCell.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormBaseField.h"

@interface TFFormTitledBaseField : TFFormBaseField

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setTitleLabelFont:(UIFont *)font UI_APPEARANCE_SELECTOR;

@end
