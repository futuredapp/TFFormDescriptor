//
//  TFFormBasicCell.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormBasicCell.h"

@implementation TFFormBasicCell

- (void)setValue:(id)value {

}

- (id)value {
    return nil;
}

- (void)configureWithData:(id)data {
    if ([data isKindOfClass:[TFRowConfiguration class]]) {
        ((TFRowConfiguration *)data).configuration(self);
    }
}


@end
