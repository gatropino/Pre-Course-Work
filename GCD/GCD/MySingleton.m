//
//  MySingleton.m
//  GCD
//
//  Created by Greg Tropino on 10/17/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton
static MySingleton* sMySingleton;

+(MySingleton *)sharedInstance
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSLog(@"Dispatch once");
        sMySingleton = [[MySingleton alloc] init];
        sleep(5);
    });
    NSLog(@"returning mysingleton = %@", sMySingleton);
    
    return sMySingleton;
}

-(id)init
{
    if (self = [super init]) {
        NSLog(@"instantiating the singleton here: %@", self);
    }
    return self;
}

-(void)describe
{
    NSLog(@"this is me");
}

@end
