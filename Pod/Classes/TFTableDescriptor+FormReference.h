//
//  TFTableDescriptor+FormReference.h
//  Pods
//
//  Created by Aleš Kocur on 27/04/15.
//
//

#import "TFTableDescriptor.h"

@class TFFormDescriptor;

@interface TFTableDescriptor (FormReference)

@property (nonatomic) TFFormDescriptor *formDescriptor;

@end
