//
//  MyClass.m
//  ApplePleaseDontRejectMe
//
//  Created by Greg Tropino on 9/17/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

- (void) sayHelloTo: (NSString *)toName
       sayHelloFrom: (NSString *)fromName
{
    NSLog(@"Hello %@ from %@", toName, fromName);
}

@end
