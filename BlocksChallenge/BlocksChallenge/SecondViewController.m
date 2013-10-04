//
//  SecondViewController.m
//  BlocksChallenge
//
//  Created by Greg Tropino on 10/1/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize showingFilteredView, tableViewFiltered;

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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [showingFilteredView count];
}


-(UITableViewCell *)tableView:(UITableView *)z cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableViewFiltered dequeueReusableCellWithIdentifier:@"aaa"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aaa"];
    }
    cell.textLabel.text =  [NSString stringWithFormat:@"%i", [[showingFilteredView objectAtIndex:indexPath.row] integerValue]];
    
    return cell;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
