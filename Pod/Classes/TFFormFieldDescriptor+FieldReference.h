//
//  TFFormFieldDescriptor+FieldReference.h
//  Pods
//
//  Created by Jakub Knejzlik on 05/05/15.
//
//

#import "TFFormFieldDescriptor.h"

@class TFFormBaseField;

@interface TFFormFieldDescriptor (FieldReference)

@property (readonly, nonatomic) TFFormBaseField *field;

@end
