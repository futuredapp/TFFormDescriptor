//
//  TFRowDescriptor+FormRowReference.h
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import <TFRowDescriptor.h>

@class TFFormFieldDescriptor;

@interface TFRowDescriptor (FormFieldReference)

@property (nonatomic) TFFormFieldDescriptor *formFieldDescriptor;

@end
