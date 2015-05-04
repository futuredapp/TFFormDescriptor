//
//  TFFormSectionDescriptor.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormSectionDescriptor.h"
#import <TFFormFieldDescriptor.h>

static TFSectionDescriptor * defaultDescriptor = nil;

@implementation TFFormSectionDescriptor

+ (instancetype)descriptorWithClass:(Class)c tag:(NSInteger)tag data:(id)data {
    
    TFFormSectionDescriptor *formSectionDescriptor = [TFFormSectionDescriptor descriptorWithTag:tag data:data];
    
    formSectionDescriptor.sectionDescriptor.sectionHeaderClass = c;
    
    return formSectionDescriptor;
    
}

+ (instancetype)descriptorWithTag:(NSInteger)tag data:(id)data {
    TFFormSectionDescriptor *formSectionDescriptor = [[TFFormSectionDescriptor alloc] init];
    formSectionDescriptor.sectionDescriptor = [TFSectionDescriptor descriptorWithTag:tag data:data];
    formSectionDescriptor.sectionDescriptor.formSectionDescriptor = formSectionDescriptor;
    
    if (defaultDescriptor && defaultDescriptor.sectionHeaderClass) {
        formSectionDescriptor.sectionDescriptor.sectionHeaderClass = defaultDescriptor.sectionHeaderClass;
    }
    
    return formSectionDescriptor;
}

+ (void)setDefaultClass:(Class)c {
    if (!defaultDescriptor) {
        defaultDescriptor = [TFSectionDescriptor descriptorWithData:nil];
    }
    
    defaultDescriptor.sectionHeaderClass = c;
}

- (void)addRow:(TFFormFieldDescriptor *)formRowDescriptor {
    [self.sectionDescriptor addRow:formRowDescriptor.rowDescriptor];
    formRowDescriptor.formSectionDescriptor = self;
}

@end
