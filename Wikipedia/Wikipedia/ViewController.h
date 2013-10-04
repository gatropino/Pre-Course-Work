//
//  ViewController.h
//  Wikipedia
//
//  Created by Greg Tropino on 10/3/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITextField *textFieldSearch;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)pressedSearchButton:(id)sender;


@end
