//
//  TFRowConfiguration.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import <Foundation/Foundation.h>

typedef void (^configurationBlock)(id configuration);

@interface TFRowConfiguration : NSObject

@property (strong, nonatomic) configurationBlock configuration;

+ (instancetype)configurationWithBlock:(configurationBlock)configurationBlock;

@end
