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
    [self.rowDescriptor.formRowDescriptor setValue:value];
}

- (id)value {
    return self.rowDescriptor.formRowDescriptor.value;
}

/// Do not subclass this unless you know what are you doing!
- (void)configureWithData:(id)data {
    if ([data isKindOfClass:[TFRowConfiguration class]]) {
        ((TFRowConfiguration *)data).configuration(self);
    }
    
    [self configureAppearance:[TFFormGlobalAppearance appearance]];
}

- (void)triggerAction:(TFFormAction)formAction {
    
    [self.rowDescriptor.section.tableDescriptor.formDescriptor triggerAction:formAction forField:self];
    
}

- (void)updateValueData{
    
}

-(id)valueData{
    return self.rowDescriptor.formRowDescriptor.value;
}
-(void)setValueData:(id)valueData{
    self.rowDescriptor.formRowDescriptor.value = valueData;
}

- (void)configureAppearance:(TFFormGlobalAppearance *)appearance {
    
}

#pragma mark - UIAppearance 

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}

- (void)setContentPadding:(UIEdgeInsets)contentPadding {
    self.leftPadding.constant =  contentPadding.left;
    self.rightPadding.constant = contentPadding.right;
    self.topPadding.constant = contentPadding.top;
    self.bottomPadding.constant = contentPadding.bottom;
}


@end
