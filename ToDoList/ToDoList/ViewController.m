//
//  ViewController.m
//  ToDoList
//
//  Created by Greg Tropino on 9/24/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import "DetailDisclosureViewController.h"


@interface ViewController () 
@end

@implementation ViewController

@synthesize array, enterText, tableView, accessoryType;


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
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    DetailDisclosureViewController *vc = [[DetailDisclosureViewController alloc] init];
    vc.text = array[indexPath.row];
    vc.index = indexPath.row;
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)detailDisclosureViewController:(DetailDisclosureViewController *)viewController textEdited:(NSString *)editedText {
    
    NSLog(@"%@", editedText);

    array[viewController.index] = editedText;
    
    //[array replaceObjectAtIndex:viewController.index withObject:editedText];

    [self dismissViewControllerAnimated:YES completion:nil];
    [tableView reloadData];
}



- (IBAction)pressedAdd:(id)sender
{
    [array addObject:enterText.text];
    [tableView reloadData];
    [enterText resignFirstResponder];
    
    
}

@end
