//
//  ViewController.m
//  NotificationCenter
//
//  Created by Greg Tropino on 10/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "RootViewController.h"

NSString *MYNotification = @"Downloaded Google";


@interface RootViewController ()
{
    id observer1, observer2;
}
@end

@implementation RootViewController

@synthesize textLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    observer1 = [nc addObserverForName:UIApplicationWillEnterForegroundNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [self incrementCount];
    }];
    observer2 = [nc addObserverForName:MYNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        self.textLabel.text = [NSString stringWithFormat:@"%i bytes", [note.object length]];
    }];
}

-(void)incrementCount
{
    int count = self.textLabel.text.intValue;
    count++;
    self.textLabel.text = [NSString stringWithFormat:@"%i", count];
    
}

- (IBAction)pressedButton:(id)sender
{
    [[NSNotificationCenter defaultCenter]postNotificationName:MYNotification object:nil];
}
     
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer1];
    [[NSNotificationCenter defaultCenter] removeObserver:observer2];

}
@end
