//
//  TFFormGlobalAppearance.m
//  Pods
//
//  Created by Aleš Kocur on 27/04/15.
//
//

#import "TFFormGlobalAppearance.h"

@implementation TFFormGlobalAppearance

+ (instancetype)appearance {
    static TFFormGlobalAppearance *appearance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appearance = [[TFFormGlobalAppearance alloc] init];
    });
    
    return appearance;
}

@end
