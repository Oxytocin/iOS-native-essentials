//
//  ViewController.m
//  test
//
//  Created by Anton Yakovenko on 22.04.15.
//  Copyright (c) 2015 Win-Interactive. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPasteboard *mainPb = [UIPasteboard generalPasteboard];
    NSData *data = [mainPb dataForPasteboardType:@"Test"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
