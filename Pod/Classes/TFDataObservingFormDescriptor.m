//
//  TFDataObservingFormDescriptor.m
//  Pods
//
//  Created by Jakub Knejzlik on 29/04/15.
//
//

#import "TFDataObservingFormDescriptor.h"

#import "TFRowDescriptor+FormRowReference.h"

@interface TFDataObservingFormDescriptor ()
@property (copy, nonatomic) NSString *currentlyChangingKey;
@end

@implementation TFDataObservingFormDescriptor

-(void)setData:(id)data{
    // make sure that old object is free of observing
    if (self.data) {
        [self.data removeObserver:self];
    }
    
    _data = data;
    
    [self updateObserver];
}


- (void)updateObserver{
    [self.data removeObserver:self];
    NSDictionary *values = [self allValues];
    for (NSString *key in values) {
        [self.data addObserver:self forKeyPath:key options:0 context:nil];
    }
}


#pragma mark - Content changes

- (void)addSection:(TFFormSectionDescriptor *)formSectionDescriptor{
    [super addSection:formSectionDescriptor];
    [self updateObserver];
}

#pragma mark - Data changes

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (object == self.data && ![keyPath isEqualToString:self.currentlyChangingKey]) {
        [self setValue:[object valueForKeyPath:keyPath] atFieldWithTag:keyPath];
    }
}



#pragma mark - Form changes

- (void)triggerAction:(TFFormAction)formAction forField:(TFFormBaseField *)field{
    if (formAction == TFFormActionStateValueDidChange) {
        [self setDataValue:[field value] forKeyPath:field.rowDescriptor.tag];
    }
    [super triggerAction:formAction forField:field];
}
- (void)setValue:(id)value atField:(TFFormFieldDescriptor *)fieldDescriptor{
    [super setValue:value atField:fieldDescriptor];
    [self setValue:value forKeyPath:fieldDescriptor.rowDescriptor.tag];
}

- (void)setDataValue:(id)value forKeyPath:(NSString *)keyPath{
    self.currentlyChangingKey = keyPath;
    self.data[self.currentlyChangingKey] = value;
    self.currentlyChangingKey = nil;
}

@end
