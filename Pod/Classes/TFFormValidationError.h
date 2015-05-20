//
//  TFFormFieldError.h
//  Pods
//
//  Created by Jakub Knejzlik on 20/05/15.
//
//

#import <Foundation/Foundation.h>

@class TFFormFieldDescriptor;

@interface TFFormValidationError : NSError

@property (strong, nonatomic) TFFormFieldDescriptor *field;

@property (strong, nonatomic) NSString *reason;

+ (instancetype)errorWithField:(TFFormFieldDescriptor *)field reason:(NSString *)reason userInfo:(NSDictionary *)dict;
- (instancetype)initWithField:(TFFormFieldDescriptor *)field reason:(NSString *)reason userInfo:(NSDictionary *)dict;

@end
