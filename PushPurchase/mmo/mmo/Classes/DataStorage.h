//
//  DataStorage.h
//  mmo
//
//  Created by Anton Yakovenko on 21.04.15.
//  Copyright (c) 2015 Win-Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStorage : NSObject

- (void)test;
- (void)subscribeForKey:(NSString *)key;


+ (id)sharedInstance;

@end
