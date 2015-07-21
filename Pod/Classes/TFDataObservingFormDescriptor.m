//
//  TFDataObservingFormDescriptor.m
//  Pods
//
//  Created by Jakub Knejzlik on 29/04/15.
//
//

#import "TFDataObservingFormDescriptor.h"

#import "TFRowDescriptor+FormFieldReference.h"
#import "TFTableDescriptor.h"

static void *TFDataObservingFormDescriptorKeyPathContext = &TFDataObservingFormDescriptorKeyPathContext;

@interface TFDataObservingFormDescriptor ()
@property (strong, nonatomic) NSMutableArray *observedKeyPaths;
@property (strong, nonatomic) TFTableDescriptor *tableDescriptor;
@end

@implementation TFDataObservingFormDescriptor

-(void)setData:(id)data{
    // make sure that old object is free of observing
    if (self.data) {
        [self unregisterObserver];
    }
    
    _data = data;
    
    for (TFRowDescriptor *row in [self.tableDescriptor allRows]) {
        if (row.formFieldDescriptor.key) {
            [self setValue:[self.data valueForKey:row.formFieldDescriptor.key] atFieldWithKey:row.formFieldDescriptor.key];
        }
    }
    
    [self updateObserver];
}

- (void)unregisterObserver{
    for (NSString *keyPath in self.observedKeyPaths) {
        [self.data removeObserver:self forKeyPath:keyPath context:TFDataObservingFormDescriptorKeyPathContext];
    }
    self.observedKeyPaths = nil;
}
- (void)updateObserver{
    [self unregisterObserver];
    if (self.data) {
        self.observedKeyPaths = [NSMutableArray array];
        for (TFRowDescriptor *row in [self.tableDescriptor allRows]) {
            NSString *key = row.formFieldDescriptor.key;
            if (row.formFieldDescriptor && key && ![self.observedKeyPaths containsObject:key]) {
                [self.data addObserver:self forKeyPath:key options:0 context:TFDataObservingFormDescriptorKeyPathContext];
                [self.observedKeyPaths addObject:key];
            }
        }
    }else{
        self.observedKeyPaths = nil;
    }
}


#pragma mark - Content changes

- (void)addSection:(TFFormSectionDescriptor *)formSectionDescriptor{
    [super addSection:formSectionDescriptor];
    [self updateObserver];
}

#pragma mark - Data changes

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (object == self.data) {
        [self updateContentVisibility];
        [self setValue:[object valueForKeyPath:keyPath] atFieldWithKey:keyPath];
    }
}



#pragma mark - Form changes

- (void)triggerAction:(TFFormAction)formAction forField:(TFFormBaseField *)field{
    if (formAction == TFFormActionStateValueDidChange) {
        [self setDataValue:[field valueData] forKeyPath:field.rowDescriptor.formFieldDescriptor.key];
    }
    [super triggerAction:formAction forField:field];
}
- (void)setValue:(id)value atField:(TFFormFieldDescriptor *)fieldDescriptor{
    [super setValue:value atField:fieldDescriptor];
}

- (void)setDataValue:(id)value forKeyPath:(NSString *)keyPath{
    if([self.data respondsToSelector:@selector(setObject:forKeyedSubscript:)]){
        self.data[keyPath] = value;
    }else{
        [self.data setValue:value forKey:keyPath];
    }
}

@end
