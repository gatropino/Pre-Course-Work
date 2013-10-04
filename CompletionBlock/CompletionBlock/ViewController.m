//
//  ViewController.m
//  CompletionBlock
//
//  Created by Greg Tropino on 10/2/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UILabel *numberOfCatsLabel;
}

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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    SecondViewController *vc = segue.destinationViewController;
    
    vc.numberOfCats = numberOfCatsLabel.text.intValue;
    
    vc.completionBlock = ^(int newNumberOfCats) {
        numberOfCatsLabel.text = [NSString stringWithFormat:@"%d", newNumberOfCats];
    };
    
    
}

@end
