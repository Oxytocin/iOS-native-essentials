//
//  AppDelegate.m
//  mmo
//
//  Created by Anton Yakovenko on 20.04.15.
//  Copyright (c) 2015 Win-Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"> Registering for notifications");
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)])
    {

        UIUserNotificationType types = UIUserNotificationTypeBadge |
                UIUserNotificationTypeSound |
                UIUserNotificationTypeAlert;
        UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:types
                                                                                             categories:nil];

        [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
        [application registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(
                UIRemoteNotificationTypeBadge |
                UIRemoteNotificationTypeSound |
                UIRemoteNotificationTypeAlert
        )];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"Registered for remote notifications");
    NSString *strToken = [NSString stringWithFormat:@"%@", deviceToken];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:strToken forKey:KEY_APNS_TOKEN];
    [[NSNotificationCenter defaultCenter] postNotificationName:NT_APNS_OBTAINED
                                                        object:nil
                                                      userInfo:userInfo];
    NSLog(@"Registered for remote notifications with token:\n%@", strToken);

}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Errorin registration. Error: %@", error);
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:error forKey:KEY_ERROR];
    [[NSNotificationCenter defaultCenter] postNotificationName:NT_APNS_FAILED
                                                        object:nil
                                                      userInfo:userInfo];
}

- (NSString *)stringWithDeviceToken:(NSData *)deviceToken {
    const char *data = [deviceToken bytes];
    NSMutableString *token = [NSMutableString string];
    NSUInteger tokenLen = [deviceToken length];
    for (int i = 0; i < tokenLen; i++) {
        [token appendFormat:@"%02.2hhX", data[i]];
    }
    return token;
}

@end
