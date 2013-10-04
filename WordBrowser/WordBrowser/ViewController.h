//
//  ViewController.h
//  WordBrowser
//
//  Created by Greg Tropino on 10/2/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordClass.h"
#import "SecondViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
