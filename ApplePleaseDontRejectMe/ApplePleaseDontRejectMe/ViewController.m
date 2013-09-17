//
//  ViewController.m
//  ApplePleaseDontRejectMe
//
//  Created by Greg Tropino on 9/17/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import "MyClass.h"
#import "AnotherClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MyClass *message = [[MyClass alloc] init];
    [message sayHelloTo:@"Greg" sayHelloFrom:@"Somebody"];
    
    AnotherClass *secondmessage = [[AnotherClass alloc] init];
    [secondmessage newMethod];
}


@end
