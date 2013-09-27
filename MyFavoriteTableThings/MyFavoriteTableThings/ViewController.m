//
//  ViewController.m
//  MyFavoriteTableThings
//
//  Created by Greg Tropino on 9/24/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize array, enterText, tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    array = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}


- (UITableViewCell *) tableView:(UITableView *)tV cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
    }
    
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}



- (IBAction)pressedAdd:(id)sender
{
    [array addObject:enterText.text];
    [tableView reloadData];
    [enterText resignFirstResponder];


}
@end
