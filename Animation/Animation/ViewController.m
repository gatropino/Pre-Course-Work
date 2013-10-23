//
//  ViewController.m
//  Animation
//
//  Created by Greg Tropino on 10/10/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize pixelView;

- (void)viewDidLoad
{
    [super viewDidLoad];
pixelView.center = self.view.center;
}

-(void)viewDidAppear:(BOOL)animated
{
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
