//
//  TFFormSectionDescriptor.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormSectionDescriptor.h"
#import <TFFormRowDescriptor.h>

static TFSectionDescriptor * defaultDescriptor = nil;

@implementation TFFormSectionDescriptor

+ (instancetype)descriptorWithClass:(Class)c tag:(NSInteger)tag data:(id)data {
    
    TFFormSectionDescriptor *formSectionDescriptor = [TFFormSectionDescriptor descriptorWithTag:tag data:data];
    
    formSectionDescriptor.sectionDescriptor.sectionClass = c;
    
    return formSectionDescriptor;
    
}

+ (instancetype)descriptorWithTag:(NSInteger)tag data:(id)data {
    TFFormSectionDescriptor *formSectionDescriptor = [[TFFormSectionDescriptor alloc] init];
    formSectionDescriptor.sectionDescriptor = [TFSectionDescriptor descriptorWithTag:tag data:data];
    
    if (defaultDescriptor && defaultDescriptor.sectionClass) {
        formSectionDescriptor.sectionDescriptor.sectionClass = defaultDescriptor.sectionClass;
    }
    
    return formSectionDescriptor;
}

+ (void)setDefaultClass:(Class)c {
    if (!defaultDescriptor) {
        defaultDescriptor = [TFSectionDescriptor descriptorWithData:nil];
    }
    
    defaultDescriptor.sectionClass = c;
}

- (void)addRow:(TFFormRowDescriptor *)formRowDescriptor {
    [self.sectionDescriptor addRow:formRowDescriptor.rowDescriptor];
    formRowDescriptor.formSectionDescriptor = self;
}

@end
