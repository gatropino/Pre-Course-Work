//
//  ViewController.m
//  Interface Builder Hackwich
//
//  Created by Greg Tropino on 9/18/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _label.text = @"Mobile Makers";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressButton2:(id)sender {
    _label.text = _textField.text;
}

- (IBAction)secondScreen:(id)sender {
    SecondViewController *nextScreen = [[SecondViewController alloc] init];
    
    [self presentViewController:nextScreen animated:YES completion:nil];
}

- (IBAction)button:(id)sender {
    
    _label.text = @"Mobile Makers Rocks";
}
@end
