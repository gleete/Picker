//
//  PickerAppDelegate.m
//  Picker
//
//  Created by Gordon Leete on 12/2/13.
//  Copyright (c) 2013 Gordon Leete. All rights reserved.
//

#import "PickerAppDelegate.h"
#import "PickerViewController.h"

@implementation PickerAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    PickerViewController *navigationController = (PickerViewController *)self.window.rootViewController;
    [navigationController saveDefaults];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    PickerViewController *navigationController = (PickerViewController *)self.window.rootViewController;
    [navigationController loadDefaults];
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



- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
