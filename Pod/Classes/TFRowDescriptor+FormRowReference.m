//
//  TFRowDescriptor+FormRowReference.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFRowDescriptor+FormRowReference.h"
#import "TFFormFieldDescriptor.h"
#import <objc/runtime.h>

@implementation TFRowDescriptor (FormRowReference)
@dynamic formRowDescriptor;

- (TFFormFieldDescriptor *)formRowDescriptor {
    
    return objc_getAssociatedObject(self, @selector(formRowDescriptor));
}

- (void)setFormRowDescriptor:(TFFormFieldDescriptor *)formRowDescriptor {
    objc_setAssociatedObject(self, @selector(formRowDescriptor), formRowDescriptor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
