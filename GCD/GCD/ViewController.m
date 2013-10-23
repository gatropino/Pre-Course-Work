//
//  ViewController.m
//  GCD
//
//  Created by Greg Tropino on 10/17/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import "MySingleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSArray *array1 = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    NSArray *array2 = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);

    [super viewDidLoad];

    dispatch_async(queue, ^{
        [array1 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [[MySingleton sharedInstance] describe];
            NSLog(@"element in array1:%@", obj);
            sleep(arc4random() %5);
        }];
    });

    dispatch_async(queue, ^{
        [array2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [[MySingleton sharedInstance] describe];
            NSLog(@"element in array2:%@", obj);
            sleep(arc4random() %5);
        }];
    });


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
