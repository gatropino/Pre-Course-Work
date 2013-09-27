//
//  ViewController.h
//  ViewsAndTouches
//
//  Created by Greg Tropino on 9/26/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"

@interface ViewController : UIViewController <MatchDelegate>
@property (weak, nonatomic) IBOutlet UILabel *missesLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchesLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (IBAction)resetButtonPressed:(id)sender;
- (IBAction)startButtonPressed:(id)sender;

@end
