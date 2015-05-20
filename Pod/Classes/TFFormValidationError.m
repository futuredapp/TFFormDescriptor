//
//  TFFormFieldError.m
//  Pods
//
//  Created by Jakub Knejzlik on 20/05/15.
//
//

#import "TFFormValidationError.h"

#import "TFFormFieldDescriptor.h"

@implementation TFFormValidationError

+ (instancetype)errorWithField:(TFFormFieldDescriptor *)field reason:(NSString *)reason userInfo:(NSDictionary *)dict{
    return [[TFFormValidationError alloc] initWithField:field reason:reason userInfo:dict];
}
- (instancetype)initWithField:(TFFormFieldDescriptor *)field reason:(NSString *)reason userInfo:(NSDictionary *)dict{
    self = [super initWithDomain:nil code:0 userInfo:dict];
    if (self) {
        self.field = field;
        self.reason = reason;
    }
    return self;
}

- (NSString *)localizedDescription{
    return [NSString stringWithFormat:@"%@: %@",self.field.rowDescriptor.tag,self.reason];
}

@end
