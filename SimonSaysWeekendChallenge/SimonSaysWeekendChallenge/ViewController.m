//
//  ViewController.m
//  SimonSaysWeekendChallenge
//
//  Created by Greg Tropino on 10/10/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import "ColorPanelView.h"

@interface ViewController ()
{
    id observer1, observer2;
    NSArray *simonArray;
    int y;
    NSMutableArray *userTouches;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    userTouches = [NSMutableArray new];
    
    y = 0;
    [super viewDidLoad];
    simonArray = @[@1, @2, @3, @4, @5, @6];

    for (int i = 0; i < [simonArray count]; i++) {
        ColorPanelView *myView = (id)[self.view viewWithTag:[[simonArray objectAtIndex:i] intValue]];
        [myView performSelector:@selector(animateColor) withObject:nil afterDelay:i];
    }
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    observer2 = [nc addObserverForName:@"Simon" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        
        [note.object performSelector:@selector(animateColor) withObject:nil];
        ColorPanelView *tempView = note.object;
        int x = tempView.tag;
        [userTouches addObject:[NSString stringWithFormat:@"%i", x]];
        NSLog(@"%@", [userTouches objectAtIndex:y]);
        y++;
        for (int z = 0; z < [userTouches count]; z++)
        {
            int compareValue1 = [[userTouches objectAtIndex:z] intValue];
            int compareValue2 = [[simonArray objectAtIndex:z] intValue];
            if (compareValue1 == compareValue2)
            {
                NSLog(@"Wohoo!");
            }
            else if (compareValue1 != compareValue2)
            {
                NSLog(@"Fail!");
            }
        }
    }];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer1];
}
@end
