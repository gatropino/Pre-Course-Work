//
//  ViewController.m
//  NotificationChallenge
//
//  Created by Greg Tropino on 10/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end




@implementation ViewController

@synthesize textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pressedGoButton:(id)sender
{
    NSString *colorText = textField.text;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ColorObserver" object:colorText];
}
@end
