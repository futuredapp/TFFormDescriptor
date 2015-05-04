//
//  TFSectionDescriptor+FormSectionReference.m
//  Pods
//
//  Created by Jakub Knejzlik on 01/05/15.
//
//

#import "TFSectionDescriptor+FormSectionReference.h"
#import "TFFormSectionDescriptor.h"
#import <objc/runtime.h>

@implementation TFSectionDescriptor (FormSectionReference)
@dynamic formSectionDescriptor;
- (TFFormSectionDescriptor *)formSectionDescriptor{
    
    return objc_getAssociatedObject(self, @selector(formSectionDescriptor));
}

- (void)setFormSectionDescriptor:(TFFormSectionDescriptor *)formSectionDescriptor{
    objc_setAssociatedObject(self, @selector(formSectionDescriptor), formSectionDescriptor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end


