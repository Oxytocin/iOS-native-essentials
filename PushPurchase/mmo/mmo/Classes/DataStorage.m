//
//  DataStorage.m
//  mmo
//
//  Created by Anton Yakovenko on 21.04.15.
//  Copyright (c) 2015 Win-Interactive. All rights reserved.
//

#import "DataStorage.h"

@implementation DataStorage

+ (id)sharedInstance {
    static DataStorage *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (void)test {
    NSLog(@"> Test!");
}

@end
