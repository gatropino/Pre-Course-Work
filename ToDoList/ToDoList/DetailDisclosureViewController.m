//
//  DetailDisclosureViewController.m
//  ToDoList
//
//  Created by Greg Tropino on 9/24/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "DetailDisclosureViewController.h"

@interface DetailDisclosureViewController ()
@end



@implementation DetailDisclosureViewController

@synthesize enterCellChange, delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];

    enterCellChange.text = _text;
    
}


- (IBAction)pressedDoneEditing:(id)sender
{
    NSString *text;
    text = enterCellChange.text;
    
    [delegate detailDisclosureViewController:self textEdited:text]; //not working

    //[self dismissViewControllerAnimated:YES completion:nil];  //have here since delegate not functioning properly

}



@end
