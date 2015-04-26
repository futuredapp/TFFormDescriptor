//
//  TFFormBasicCell.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFBasicDescriptedCell.h"
#import "TFRowConfiguration.h"

@protocol TFFormBasicCellProtocol <NSObject>

- (void)setValue:(id)value;
- (id)value;

@end

@interface TFFormBasicCell : TFBasicDescriptedCell<TFFormBasicCellProtocol>

@end
