//
//  AppDelegate.m
//  acquireio-cobrowse-ios
//
//  Created by Raju Jangid on 9/17/2017.
//  Copyright © 2017 AcquireIO Inc. All rights reserved.
//

#import "AppDelegate.h"
#import <AcquireIO/AcquireIO.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(void) setupAcquireIO{
    
    NSString *accountID = @"<YOUR_ACCOUNT_ID>";
#error TODO: To start using this project, copy-paste your YOUR_ACCOUNT_ID and comment this line, see more https://goo.gl/6KKNRG
    
    NSDictionary *option = @{@"UseDefaultTheme":@YES,
                             //@"ScreenShareBorder": @NO,
                             @"ShowDefaultStopButton": @NO
                             };
    
    AcquireIOConfig *config = [AcquireIOConfig config];
    [config setDict:option];
    
#error TODO: To start Verify your users, see more https://goo.gl/maZws4 or comment following 2 lines
    [[AcquireIO support] setVisitorHash:@"<_Nonnull String your_hmac_of_email>"];
    [[AcquireIO support] setVisitor:@"<Nullable String Name>" phone:@"<Nullable String Phone Number>" andEmail:@"<Nullable String Email>"];
    
#error TODO: To add extra field for online visitor, see more https://goo.gl/n9eWHq or comment following  line
    [[AcquireIO support] setVisitorExtraField:@[@{@"l":@"<LABLE OPTIONAL>",@"n":@"<Name key>",@"v":@"<Value>"}]];

    [[AcquireIO support] setAccount:accountID withOptions:config];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
