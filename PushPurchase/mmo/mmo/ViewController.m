//
//  ViewController.m
//  mmo
//
//  Created by Anton Yakovenko on 20.04.15.
//  Copyright (c) 2015 Win-Interactive. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import "DataStorage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"> View Did Load");
    UIColor *borderColor = [UIColor grayColor];
    self.apnsTextView.layer.borderWidth = 0.5;
    self.apnsTextView.layer.borderColor = borderColor.CGColor;
    self.apnsTextView.layer.cornerRadius = 5.0;
    
    // Set text view to the top
    [self.apnsTextView setContentOffset:CGPointZero animated:YES];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self
                           selector:@selector(didRecieveNotification:)
                               name:NT_APNS_OBTAINED
                             object:nil];
    
    [notificationCenter addObserver:self
                           selector:@selector(didRecieveNotification:)
                               name:NT_APNS_FAILED
                             object:nil];

    [[DataStorage sharedInstance] test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didRecieveNotification:(NSNotification *)notification {
    NSString *ntName = notification.name;
    if ([ntName isEqualToString:NT_APNS_OBTAINED])
    {
        NSDictionary *userInfo = notification.userInfo;
        NSString *apnsToken = [userInfo objectForKey:KEY_APNS_TOKEN];
        NSLog(@"Did receive notification. Token: %@", apnsToken);
        [self.apnsTextView setText:apnsToken];
    }
    else if ([ntName isEqualToString:NT_APNS_FAILED])
    {
        NSDictionary *userInfo = notification.userInfo;
        NSError *error = [userInfo objectForKey:KEY_ERROR];
        [self.apnsTextView setText:@""];
    }
}

@end
