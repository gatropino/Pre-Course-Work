//
//  ViewController.m
//  ViewsAndTouches
//
//  Created by Greg Tropino on 9/26/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    float number;
    int previousTag;
    int missEvaluator;
    int matchesMade;
    int misses;
    int previousScore;
    
    NSTimer *timer;
    MyView *currentView;
    MyView *passedView;
    NSMutableArray *array;
    UILabel *previousHighScore;
}

@end

@implementation ViewController

@synthesize missesLabel, matchesLabel, timeLabel, startButton, matchImage, missImage, highScoreLabel, pauseOverlayButton, pauseButton, resumeButton, startGameButton, startGameScreen;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(defaultDuffImage)];
    passedView = [[MyView alloc] init];
    
    pauseOverlayButton.hidden = YES;
    resumeButton.hidden = YES;
    pauseButton.hidden = YES;
    pauseOverlayButton.userInteractionEnabled = NO;
    resumeButton.userInteractionEnabled = NO;
    pauseButton.userInteractionEnabled = NO;
    self.view.backgroundColor = [UIColor yellowColor];
    
}

-(void)defaultDuffImage
{
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[MyView class]]) {
            MyView *myview = (MyView*)view;
            myview.delegate = self;
            myview.userInteractionEnabled = NO;
            
            UIGraphicsBeginImageContext(myview.frame.size);
            [[UIImage imageNamed:@"duffCard.jpg"] drawInRect:myview.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            myview.backgroundColor = [UIColor colorWithPatternImage:image];
        }
    }
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
            view.userInteractionEnabled = NO;
            passedView.userInteractionEnabled = NO;
            matchesMade++;
            previousTag = 0;
            missEvaluator = 0;
            matchImage.hidden = NO;
            [self performSelector:@selector(successfulMatchImage) withObject:nil afterDelay:0.25f];
            [self performSelector:@selector(hideMatchImage) withObject:nil afterDelay:1.0f];
            
            NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"wohooSound"  ofType:@"wav"];
            CFURLRef clapURL = (__bridge CFURLRef ) [NSURL fileURLWithPath:clapPath];
            SystemSoundID clappingFileID;
            AudioServicesCreateSystemSoundID (clapURL, &clappingFileID);
            AudioServicesPlaySystemSound (clappingFileID);
            
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
            previousTag = 0;
            missEvaluator = 0;
            misses++;
            missImage.hidden = NO;
            currentView.userInteractionEnabled = YES;
            passedView.userInteractionEnabled = YES;
            
            NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"dohWrongOneSound"  ofType:@"wav"];
            CFURLRef clapURL = (__bridge CFURLRef ) [NSURL fileURLWithPath:clapPath];
            SystemSoundID clappingFileID;
            AudioServicesCreateSystemSoundID (clapURL, &clappingFileID);
            AudioServicesPlaySystemSound (clappingFileID);
            
            [self performSelector:@selector(changeMissesBack) withObject:nil afterDelay:.35];
            [self performSelector:@selector(hideMissImage) withObject:nil afterDelay:.5];
        }
        
        if (matchesMade == 8)
        {
            
            pauseButton.hidden = YES;
            [self performSelector:@selector(scoreEvaluator)];
            [self performSelector:@selector(defaultDuffImage) withObject:nil afterDelay:.5];
            [timer invalidate];
            
            NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"winningSound"  ofType:@"wav"];
            CFURLRef clapURL = (__bridge CFURLRef ) [NSURL fileURLWithPath:clapPath];
            SystemSoundID clappingFileID;
            AudioServicesCreateSystemSoundID (clapURL, &clappingFileID);
            AudioServicesPlaySystemSound (clappingFileID);
            
        }
    }
    missesLabel.text = [NSString stringWithFormat:@"Misses = %i", misses];
    matchesLabel.text = [NSString stringWithFormat:@"Matches = %i", matchesMade];
    NSLog(@"Tag = %i, view.tag", view.tag);
    
}

-(void)scoreEvaluator
{
    
    int x = [timeLabel.text integerValue];
    int y = [missesLabel.text integerValue];
    int score = 100 - (x/2) - y;
    
    if (previousScore < score)
    {
        highScoreLabel.text = [NSString stringWithFormat:@"Current High Score: %i", score];
        previousHighScore.text = highScoreLabel.text;
        previousScore = score;
    }
}

-(void)successfulMatchImage
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"star.jpg"] drawInRect:currentView.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    currentView.backgroundColor = [UIColor colorWithPatternImage:image];
    passedView.backgroundColor = [UIColor colorWithPatternImage:image];
}

-(void)changeMissesBack
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"duffCard.jpg"] drawInRect:currentView.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    currentView.backgroundColor = [UIColor colorWithPatternImage:image];
    passedView.backgroundColor = [UIColor colorWithPatternImage:image];
}

-(void)hideMissImage
{
    missImage.hidden = YES;
}

-(void)hideMatchImage
{
    matchImage.hidden = YES;
}

-(void)countUp
{
    number = number + 0.1;
    timeLabel.text = [NSString stringWithFormat:@"%.02f", number];
}


- (IBAction)startGameButtonPressed:(id)sender
{
    startGameScreen.hidden = YES;
    startGameButton.hidden = YES;
    
    NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"beerSound"  ofType:@"wav"];
    CFURLRef clapURL = (__bridge CFURLRef ) [NSURL fileURLWithPath:clapPath];
    SystemSoundID clappingFileID;
    AudioServicesCreateSystemSoundID (clapURL, &clappingFileID);
    AudioServicesPlaySystemSound (clappingFileID);
    
    
}

- (IBAction)resumeButtonPressed:(id)sender
{
    pauseButton.hidden = NO;
    pauseOverlayButton.userInteractionEnabled = NO;
    pauseOverlayButton.hidden = YES;
    resumeButton.hidden = YES;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target: self selector:@selector(countUp) userInfo:nil repeats:YES];
}

- (IBAction)pauseButtonPressed:(id)sender
{
    pauseOverlayButton.hidden = NO;
    pauseOverlayButton.userInteractionEnabled = YES;
    resumeButton.userInteractionEnabled = YES;
    resumeButton.hidden = NO;
    pauseButton.hidden = YES;
    startButton.hidden = YES;
    [timer invalidate];
}

- (IBAction)resetButtonPressed:(id)sender
{
    [self performSelector:@selector(defaultDuffImage)];
    timeLabel.text = [NSString stringWithFormat:@"%.02f", number];
    startButton.hidden = NO;
    startButton.userInteractionEnabled = YES;
    pauseButton.hidden = YES;
    resumeButton.hidden = YES;
    pauseOverlayButton.hidden = YES;
    
    [timer invalidate];
    number = 0;
    misses = 0;
    matchesMade = 0;
    missesLabel.text = 0;
    matchesLabel.text = 0;
    
    NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"resetSound"  ofType:@"wav"];
    CFURLRef clapURL = (__bridge CFURLRef ) [NSURL fileURLWithPath:clapPath];
    SystemSoundID clappingFileID;
    AudioServicesCreateSystemSoundID (clapURL, &clappingFileID);
    AudioServicesPlaySystemSound (clappingFileID);
    
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
    startButton.userInteractionEnabled = NO;
    pauseButton.userInteractionEnabled = YES;
    pauseButton.hidden = NO;
}

@end
