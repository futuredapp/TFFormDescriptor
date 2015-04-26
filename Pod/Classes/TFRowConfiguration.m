//
//  TFRowConfiguration.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFRowConfiguration.h"

@implementation TFRowConfiguration

+ (instancetype)configuration:(configurationBlock)configurationBlock {
    TFRowConfiguration *cfg = [[TFRowConfiguration alloc] init];
    cfg.configuration = configurationBlock;
    return cfg;
}

@end
