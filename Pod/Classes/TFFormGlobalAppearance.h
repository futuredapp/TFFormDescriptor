//
//  TFFormGlobalAppearance.h
//  Pods
//
//  Created by Aleš Kocur on 27/04/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TFFormGlobalAppearance : NSObject

@property (nonatomic, strong) UIFont *defaultFont;

+ (instancetype)appearance;

@end
