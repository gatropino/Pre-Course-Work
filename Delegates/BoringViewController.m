//
//  BoringViewController.m
//  Delegates
//
//  Created by Greg Tropino on 9/23/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "BoringViewController.h"

@interface BoringViewController ()

@end

@implementation BoringViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeGreen:(id)sender
{
    [delegate changeColor:[UIColor greenColor]];
}

- (IBAction)changeRed:(id)sender
{
    [delegate changeColor:[UIColor redColor]];
}
@end
