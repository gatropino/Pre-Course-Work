//
//  ViewController.m
//  NSArray
//
//  Created by Greg Tropino on 9/24/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textField, tableView, array;

- (void)viewDidLoad
{
    [super viewDidLoad];

    array = [[NSMutableArray alloc] init];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

- (UITableViewCell *) tableView:(UITableView *)tV cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
        cell.textLabel.textColor = [UIColor redColor];
    }
    
    
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditViewController *editViewController = [[EditViewController alloc] init];
    
    editViewController.delegate = self;
    editViewController.index = indexPath.row;
    editViewController.passedText = array[indexPath.row];
    
    [self.navigationController pushViewController:editViewController animated:YES];
    
}

- (IBAction)buttonPressed:(id)sender
{
    
    [array addObject:textField.text];
    [tableView reloadData];
    [textField resignFirstResponder];
    
    NSLog(@"%@", array);
    //self.label.text = @"";

  /*  for (NSString *string in self.array)
    {
        NSString *newString = [NSString stringWithFormat:@" %@", string];
        self.label.text = [self.label.text stringByAppendingString:newString];
    }
    */
}

-(void)editViewController:(id)evc didEdit:(NSString *)text index:(int)index
{
    array[index] = text;
    [tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
