//
//  ViewController.m
//  Categories
//
//  Created by Greg Tropino on 10/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import "NSString+ReverseString.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textLabel, textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedButton:(id)sender
{
    NSString *text = textField.text;
    textLabel.text = text.reverseString;

}
@end
