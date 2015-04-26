//
//  TFTextFieldCell.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import <UIKit/UIKit.h>
#import <TFFormBasicCell.h>

@interface TFTextField : TFFormBasicCell

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title placeholder:(NSString *)placeholder value:(NSString *)value;

- (void)setBackgroundColor:(UIColor *)backgroundColor UI_APPEARANCE_SELECTOR;

@end
