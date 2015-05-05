//
//  TFRowDescriptor+FormRowReference.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFRowDescriptor+FormFieldReference.h"
#import "TFFormFieldDescriptor.h"
#import <objc/runtime.h>

@implementation TFRowDescriptor (FormFieldReference)
@dynamic formFieldDescriptor;

- (TFFormFieldDescriptor *)formFieldDescriptor {
    
    return objc_getAssociatedObject(self, @selector(formRowDescriptor));
}

- (void)setFormFieldDescriptor:(TFFormFieldDescriptor *)formRowDescriptor {
    objc_setAssociatedObject(self, @selector(formRowDescriptor), formRowDescriptor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
