//
//  TFTableDescriptor+FormReference.m
//  Pods
//
//  Created by Aleš Kocur on 27/04/15.
//
//

#import "TFTableDescriptor+FormReference.h"
#import "TFFormDescriptor.h"
#import <objc/runtime.h>

@implementation TFTableDescriptor (FormReference)

- (TFFormDescriptor *)formDescriptor {
    return objc_getAssociatedObject(self, @selector(formDescriptor));
}

- (void)setFormDescriptor:(TFFormDescriptor *)formDescriptor {
    objc_setAssociatedObject(self, @selector(formDescriptor), formDescriptor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
