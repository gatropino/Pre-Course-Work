//
//  ViewController.h
//  ToDoList
//
//  Created by Greg Tropino on 9/24/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateChangeDisclosure.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, DetailDisclosureViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *enterText;
@property(nonatomic) UITableViewCellAccessoryType accessoryType;

- (IBAction)pressedAdd:(id)sender;

@end
