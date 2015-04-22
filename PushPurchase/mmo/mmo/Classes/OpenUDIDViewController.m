//
//  OpenUDIDViewController.m
//  mmo
//
//  Created by Anton Yakovenko on 22.04.15.
//  Copyright (c) 2015 Win-Interactive. All rights reserved.
//

#import "OpenUDIDViewController.h"
#import "OpenUDID.h"

@implementation OpenUDIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"> OpenUDID View Test loaded");
//    NSString *openUDID = [OpenUDID value];
//    NSLog(@"> Open UDID: %@", openUDID);
    
    UIPasteboard *mainPb = [UIPasteboard generalPasteboard];
    NSData *data = [mainPb dataForPasteboardType:@"Test"];
    if (!data)
    {
        NSLog(@"> No data 'Test' in general PB");
    }
    else
    {
        NSLog(@"> Found data 'Test' in general PB: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }
}

@end
