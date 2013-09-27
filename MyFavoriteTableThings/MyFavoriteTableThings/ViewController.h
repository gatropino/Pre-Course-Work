//
//  ViewController.h
//  MyFavoriteTableThings
//
//  Created by Greg Tropino on 9/24/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *enterText;
@property (strong, nonatomic) NSMutableArray *array;

- (IBAction)pressedAdd:(id)sender;


@end
