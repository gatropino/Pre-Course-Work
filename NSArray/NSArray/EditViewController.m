//
//  EditViewController.m
//  NSArray
//
//  Created by Greg Tropino on 9/25/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

@synthesize delegate, textField, index, passedText;

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
    self.title =@"Edit Row"; //Can't edit title on views outside of storyboard, have to set manually
    textField.text = passedText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)endEditingWithButton:(id)sender
{
    [delegate editViewController:self didEdit:textField.text index:index];
}
@end
