//
//  PixelView.m
//  Animation
//
//  Created by Greg Tropino on 10/10/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "PixelView.h"

@implementation PixelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.5f animations:^{
        int z = arc4random_uniform(75);
        int c = arc4random_uniform(75);
        int v = arc4random_uniform(2);
        if (v == 1)
        {
            z = z * -1;
            c = c * -1;
        }
        self.center = CGPointMake(self.center.x + z, self.center.y + c);

        if (self.center.x + self.bounds.size.width >= [[UIScreen mainScreen] bounds].size.width)  //checks for going too far right
        {
            self.center = CGPointMake(self.center.x - 100, self.center.y);
            
            if (self.center.y + self.bounds.size.height >= [[UIScreen mainScreen] bounds].size.height) //checks for going too low
            {
                self.center = CGPointMake(self.center.x, self.center.y - 100);
            }
            if (self.center.y - self.bounds.size.height<= 0) // checks for going too high
            {
                self.center = CGPointMake(self.center.x, self.center.y + 100);
            }
        }
        if (self.center.x - self.bounds.size.width < 0) //checks for going too far left
        {
            self.center = CGPointMake(self.center.x + 100, self.center.y);
            
            if (self.center.y + self.bounds.size.height >= [[UIScreen mainScreen] bounds].size.height) //checks for going too low
            {
                self.center = CGPointMake(self.center.x, self.center.y - 100);
            }
            if (self.center.y - self.bounds.size.height<= 0) // checks for going too high
            {
                self.center = CGPointMake(self.center.x, self.center.y + 100);
            }
        }
    
    }];
    NSLog(@"%f", self.bounds.size.width);
    NSLog(@"%f", self.bounds.size.height);

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.5f animations:^{
        self.backgroundColor = [UIColor redColor];
    } completion:^(BOOL finished) {
       // [UIView animateWithDuration:0.5f animations:^{
            [UIView animateWithDuration:0.25f delay:0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                self.backgroundColor = [UIColor cyanColor];
                
                [PixelView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];

            } completion:^(BOOL finished) {
                
            }];
            
            //[PixelView beginAnimations:nil context:NULL];
            
            //[PixelView setAnimationDuration:.25];
            //[PixelView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
            //[PixelView commitAnimations];

       // }];
    }];
    
    
}


@end
