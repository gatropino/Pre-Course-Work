//
//  SecondViewController.m
//  Storyboard
//
//  Created by Greg Tropino on 9/30/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

-(IBAction)navigation:(id)sender;


@end

@implementation SecondViewController

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
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)navigation:(id)sender
{
    [self performSegueWithIdentifier:@"MySegue" sender:self];
}



-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ThirdViewController *thirdViewController = segue.destinationViewController;
    //[thirdViewController setMyLabelName:@"help me"];
    thirdViewController.myLabelName = @"steve";
    
    //[thirdViewController setMyLabelName:@"steve"];
    
}


@end
