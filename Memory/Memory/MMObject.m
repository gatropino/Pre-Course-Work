//
//  MMObject.m
//  Memory
//
//  Created by Greg Tropino on 9/26/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "MMObject.h"

@implementation MMObject

-(void) dealloc
{
    NSLog(@"MMObject deallocated %@", self);
    [super dealloc];
}

@end
