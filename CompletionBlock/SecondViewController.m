//
//  SecondViewController.m
//  CompletionBlock
//
//  Created by Greg Tropino on 10/2/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
{
    UITextField *textField;
}

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
	// Do any additional setup after loading the view.
}


-(IBAction)pressedButton:(id)sender
{
    _completionBlock(_textField.text.intValue);
}

@end
