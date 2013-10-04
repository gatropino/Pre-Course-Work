//
//  MyView.m
//  ViewsAndTouches
//
//  Created by Greg Tropino on 9/26/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    int currentTag = self.tag;
    self.userInteractionEnabled = NO;
    
    [MyView beginAnimations:nil context:NULL];
    [MyView setAnimationDuration:.25];
    [MyView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self cache:YES];
    [MyView commitAnimations];
    
    if (self.tag == 1)
    {
        UIGraphicsBeginImageContext(self.frame.size);
        [[UIImage imageNamed:@"barney.png"] drawInRect:self.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.backgroundColor = [UIColor colorWithPatternImage:image];
    
    } else if (self.tag == 2)
    {
        UIGraphicsBeginImageContext(self.frame.size);
        [[UIImage imageNamed:@"bart.jpeg"] drawInRect:self.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.backgroundColor = [UIColor colorWithPatternImage:image];

    } else if (self.tag == 3)
    {
        UIGraphicsBeginImageContext(self.frame.size);
        [[UIImage imageNamed:@"flanders.jpg"] drawInRect:self.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.backgroundColor = [UIColor colorWithPatternImage:image];

    } else if (self.tag == 4)
    {
        UIGraphicsBeginImageContext(self.frame.size);
        [[UIImage imageNamed:@"homerFalling.png"] drawInRect:self.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.backgroundColor = [UIColor colorWithPatternImage:image];
    } else if (self.tag == 5)
    {
        UIGraphicsBeginImageContext(self.frame.size);
        [[UIImage imageNamed:@"lisa.jpg"] drawInRect:self.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.backgroundColor = [UIColor colorWithPatternImage:image];
    } else if (self.tag == 6)
    {
        UIGraphicsBeginImageContext(self.frame.size);
        [[UIImage imageNamed:@"maggy.gif"] drawInRect:self.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.backgroundColor = [UIColor colorWithPatternImage:image];
    } else if (self.tag == 7)
    {
        UIGraphicsBeginImageContext(self.frame.size);
        [[UIImage imageNamed:@"margeFamily.png"] drawInRect:self.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.backgroundColor = [UIColor colorWithPatternImage:image];
    } else if (self.tag == 8)
    {
        UIGraphicsBeginImageContext(self.frame.size);
        [[UIImage imageNamed:@"moe.png"] drawInRect:self.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.backgroundColor = [UIColor colorWithPatternImage:image];
    } else
    {
        NSLog(@"something went HORRIBLY wrong");
    }

    
    
    //self.backgroundColor = [UIColor purpleColor];
    //self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"roseimage.jpg"]];

    
    [self.delegate didChooseView:self tagOfView:currentTag];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
