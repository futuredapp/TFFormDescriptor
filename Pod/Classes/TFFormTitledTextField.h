//
//  TFTextFieldCell.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import <UIKit/UIKit.h>
#import "TFFormTitledBaseField.h"

@interface TFFormTitledTextField : TFFormTitledBaseField

@property (strong, nonatomic) IBOutlet UITextField *textField;

+ (TFRowConfiguration *)configurationWithTitle:(NSString *)title placeholder:(NSString *)placeholder value:(NSString *)value;



@end
