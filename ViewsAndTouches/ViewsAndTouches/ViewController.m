//
//  ViewController.m
//  ViewsAndTouches
//
//  Created by Greg Tropino on 9/26/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
float number;
int previousTag;
int missEvaluator;
int matchesMade;
int misses;

NSTimer *timer;
MyView *currentView;
MyView *passedView;
NSMutableArray *array;
}

@end

@implementation ViewController

@synthesize missesLabel, matchesLabel, timeLabel, startButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[MyView class]]) {
            MyView *myview = (MyView*)view;
            myview.delegate = self;
            myview.backgroundColor = [UIColor greenColor];
            myview.userInteractionEnabled = NO;
        }
    }
    
    passedView = [[MyView alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) didChooseView:(UIView *)view tagOfView:(int)currentTag
{
    currentView = (MyView*)view;
    if (passedView != view)
    {
    if (currentTag == previousTag)
    {
        NSLog(@"Found a match!!!");
        view.backgroundColor = [UIColor blueColor];
        passedView.backgroundColor = [UIColor blueColor];
        view.userInteractionEnabled = NO;
        passedView.userInteractionEnabled = NO;
        previousTag = 0;
        matchesMade++;
        missEvaluator = 0;
    }
    else if (!previousTag) {
        passedView = (MyView*)view;
        previousTag = currentTag;
        missEvaluator++;
    }
        else
        {
            previousTag = currentTag;
            missEvaluator++;
        }
    if (missEvaluator == 2)
    {
        [self performSelector:@selector(changeColor) withObject:nil afterDelay:.5];
        previousTag = 0;
        missEvaluator = 0;
        misses++;
    }
    if (matchesMade == 8)
    {
        for (UIView *view in self.view.subviews) {
            if ([view isKindOfClass:[MyView class]]) {
                MyView *myview = (MyView*)view;
                myview.backgroundColor = [UIColor greenColor];
                [timer invalidate];
    }
    }
    }
    }
    missesLabel.text = [NSString stringWithFormat:@"Misses = %i", misses];
    matchesLabel.text = [NSString stringWithFormat:@"Matches = %i", matchesMade];
    NSLog(@"Tag = %i, view.tag", view.tag);
    }
-(void)changeColor
{
    currentView.backgroundColor = [UIColor greenColor];
    passedView.backgroundColor = [UIColor greenColor];

}

-(void)countUp
{
    number = number + 0.1;
    timeLabel.text = [NSString stringWithFormat:@"%.02f", number];
}


- (IBAction)resetButtonPressed:(id)sender
{
    misses = 0;
    matchesMade = 0;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[MyView class]]) {
            MyView *myview = (MyView*)view;
            myview.backgroundColor = [UIColor greenColor];
            myview.userInteractionEnabled = NO;
        }
        }
    [timer invalidate];
    number = 0;
    timeLabel.text = [NSString stringWithFormat:@"%.02f", number];
    startButton.hidden = NO;
    missesLabel.text = 0;
    matchesLabel.text = 0;

}

- (IBAction)startButtonPressed:(id)sender
{
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[MyView class]]) {
            MyView *myview = (MyView*)view;
            myview.userInteractionEnabled = YES;
        }
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target: self selector:@selector(countUp) userInfo:nil repeats:YES];
    startButton.hidden = YES;
}



@end
