//
//  ThirdViewController.m
//  Storyboard
//
//  Created by Greg Tropino on 9/30/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

{
    __weak IBOutlet UILabel *myLabel;
}

@end

@implementation ThirdViewController

@synthesize myLabelName;

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

    myLabel.text = myLabelName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setMyLabelName:(NSString *)_myLabelName
{
    myLabelName = _myLabelName;
}

@end
