//
//  ViewController.h
//  NSArray
//
//  Created by Greg Tropino on 9/24/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, EditViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)buttonPressed:(id)sender;

@end
