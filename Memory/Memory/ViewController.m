//
//  ViewController.m
//  Memory
//
//  Created by Greg Tropino on 9/26/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import "MMObject.h"

@interface ViewController ()
{
    NSMutableArray *myArray;
    MMObject *myObject;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myArray = [NSMutableArray arrayWithCapacity:10];
    myObject = [[MMObject alloc] init];
    
    NSLog(@"the retain count is %i (%@)", [myObject retainCount], myObject);
    [myArray addObject:myObject];
    NSLog(@"the retain count is %i (%@)", [myObject retainCount], myObject);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_memoryTest release];
    [super dealloc];
}
- (IBAction)memoryTest:(id)sender
{
    NSLog(@"the retain count is %i (%@)", [myObject retainCount], myObject);
}

@end
