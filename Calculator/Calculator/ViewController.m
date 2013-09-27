//
//  ViewController.m
//  Calculator
//
//  Created by Greg Tropino on 9/18/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)addTogether:(id)sender {
    
    int x, y, z;
    x = [_firstInput.text intValue];
    y = [_secondInput.text intValue];
    z = x + y;
    _total.text = [NSString stringWithFormat:@"The total is %i", z];
    
}

- (IBAction)minus:(id)sender {
    int x, y, z;
    
    x = [_firstInput.text intValue];
    y = [_secondInput.text intValue];
    z = x - y;
    _total.text = [NSString stringWithFormat:@"The total is %i", z];
    
}

- (IBAction)divis:(id)sender {
    int x, y, z;
    
    x = [_firstInput.text intValue];
    y = [_secondInput.text intValue];
    z = x / y;
    _total.text = [NSString stringWithFormat:@"The total is %i", z];
    
}

- (IBAction)multi:(id)sender {
    int x, y, z;
    
    x = [_firstInput.text intValue];
    y = [_secondInput.text intValue];
    z = x * y;
    _total.text = [NSString stringWithFormat:@"The total is %i", z];
    
}
@end
