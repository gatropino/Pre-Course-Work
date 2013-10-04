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
@property (weak, nonatomic) IBOutlet UIImageView *matchImage;
@property (weak, nonatomic) IBOutlet UIImageView *missImage;
@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseOverlayButton;
@property (weak, nonatomic) IBOutlet UIButton *resumeButton;
@property (weak, nonatomic) IBOutlet UIButton *startGameButton;
@property (weak, nonatomic) IBOutlet UIButton *startGameScreen;


- (IBAction)startGameButtonPressed:(id)sender;
- (IBAction)resumeButtonPressed:(id)sender;
- (IBAction)pauseButtonPressed:(id)sender;
- (IBAction)resetButtonPressed:(id)sender;
- (IBAction)startButtonPressed:(id)sender;

@end
