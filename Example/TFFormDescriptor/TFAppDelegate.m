//
//  TFAppDelegate.m
//  TFFormDescriptor
//
//  Created by CocoaPods on 04/24/2015.
//  Copyright (c) 2014 Ales Kocur. All rights reserved.
//

#import "TFAppDelegate.h"
#import <TFFormTitledTextField.h>
#import <TFFormTitledBaseField.h>
#import <TFFormGlobalAppearance.h>
#import <TFFormTitledSwitchField.h>
#import <TFFormTitledTextViewField.h>

@implementation TFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    
    [[TFFormTitledBaseField appearance] setTitleLabelFont:[UIFont systemFontOfSize:15.0]];
    [[TFFormTitledTextField appearance] setBackgroundColor:[UIColor lightGrayColor]];
    
    [[TFFormGlobalAppearance appearance] setDefaultFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:11.0]];
    
    [[TFFormTitledSwitchField appearance] setSwitchOnTintColor:[UIColor redColor]];
    [[TFFormTitledSwitchField appearance] setSwitchTintColor:[UIColor greenColor]];
    [[TFFormTitledSwitchField appearance] setTitleLabelFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:10.0]];
    [[TFFormTitledSwitchField appearance] setContentPadding:UIEdgeInsetsMake(6, 10, 6, 10)];
    [[TFFormTitledSwitchField appearance] setSwitchThumbTintColor:[UIColor blackColor]];
    
    [[TFFormTitledTextField appearance] setContentPadding:UIEdgeInsetsMake(10, 10, 10, 10)];
    [[TFFormTitledTextField appearance] setTextFieldTextColor:[UIColor grayColor]];
    [[TFFormTitledTextField appearance] setTextFieldBorderStyle:UITextBorderStyleNone];
    [[TFFormTitledTextField appearance] setTextFieldTextAlignment:NSTextAlignmentRight];
    [[TFFormTitledTextField appearance] setTextFieldPlaceholderAttributes:@{ NSForegroundColorAttributeName : [UIColor redColor] }];
    [[TFFormTitledTextField appearance] setTitleLabelMargin:10];
    
    [[TFFormTitledTextViewField appearance] setBackgroundColor:[UIColor lightGrayColor]];
    [[TFFormTitledTextViewField appearance] setTextViewTextAlignment:NSTextAlignmentCenter];
    [[TFFormTitledTextViewField appearance] setTextViewFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:12.0]];
    [[TFFormTitledTextViewField appearance] setTextViewBackgroundColor:[UIColor whiteColor]];
    [[TFFormTitledTextViewField appearance] setTextViewPlaceholderColor:[UIColor lightGrayColor]];
    [[TFFormTitledTextViewField appearance] setTextViewTintColor:[UIColor redColor]];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
