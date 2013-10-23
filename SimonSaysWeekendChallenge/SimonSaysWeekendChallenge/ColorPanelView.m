//
//  ColorPanelView.m
//  SimonSaysWeekendChallenge
//
//  Created by Greg Tropino on 10/10/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ColorPanelView.h"


@implementation ColorPanelView {
    NSArray *simonArray;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Simon" object:self];
    
    int x = self.tag;
}

-(void)animateColor
{
    UIColor *originalColor = self.backgroundColor;
    
    [UIView animateWithDuration:1.5f animations:^{
        self.backgroundColor = [UIColor whiteColor];
    } completion:^(BOOL finished) {
        self.backgroundColor = originalColor;
    } ];
    
    
    
}

@end
