//
//  ViewController.h
//  BlocksChallenge
//
//  Created by Greg Tropino on 10/1/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "ThresholdViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *evenButton;
@property (weak, nonatomic) IBOutlet UIButton *oddButton;
@property (weak, nonatomic) IBOutlet UITableView *tableViewShowAll;
@property (weak, nonatomic) IBOutlet UIButton *thresholdButton;

@property NSMutableArray *numbersArray;
@property NSMutableArray *evenNumbersArray;
@property NSMutableArray *oddNumbersArray;

- (IBAction)pressedThresholdButton:(id)sender;
- (IBAction)pressedEvenButton:(id)sender;



@end
