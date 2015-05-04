//
//  TFSectionDescriptor+FormSectionReference.h
//  Pods
//
//  Created by Jakub Knejzlik on 01/05/15.
//
//

#import <TFSectionDescriptor.h>

@class TFFormSectionDescriptor;

@interface TFSectionDescriptor (FormSectionReference)

@property (nonatomic) TFFormSectionDescriptor *formSectionDescriptor;

@end
