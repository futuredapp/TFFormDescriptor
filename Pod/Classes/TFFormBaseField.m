//
//  TFFormBasicCell.m
//  Pods
//
//  Created by Aleš Kocur on 26/04/15.
//
//

#import "TFFormBaseField.h"
#import "TFFormSectionDescriptor.h"
#import "TFFormDescriptor.h"
#import "TFSectionDescriptor.h"
#import "TFTableDescriptor+FormReference.h"

@implementation TFFormBaseField

- (void)setValue:(id)value {
    
}

- (id)value {
    return nil;
}

/// Do not subclass this unless you know what are you doing!
- (void)configureWithData:(id)data {
    if ([data isKindOfClass:[TFRowConfiguration class]]) {
        ((TFRowConfiguration *)data).configuration(self);
    }
    
    [self configureAppearance:[TFFormGlobalAppearance appearance]];
}

- (void)triggerAction:(TFFormAction)formAction {
    
    if (self.rowDescriptor.section.tableDescriptor.formDescriptor.delegate && [self.rowDescriptor.section.tableDescriptor.formDescriptor.delegate respondsToSelector:@selector(formDescriptor:didTriggerAction:field:tag:)]) {
        [self.rowDescriptor.section.tableDescriptor.formDescriptor.delegate formDescriptor:self.rowDescriptor.section.tableDescriptor.formDescriptor didTriggerAction:formAction field:self.rowDescriptor.formRowDescriptor tag:self.rowDescriptor.tag];
    }
    
}

- (void)configureAppearance:(TFFormGlobalAppearance *)appearance {
    
}

#pragma mark - UIAppearance 

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}


@end
