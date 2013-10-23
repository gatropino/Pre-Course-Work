//
//  UIColor+ChangeColor.m
//  NotificationChallenge
//
//  Created by Greg Tropino on 10/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "UIColor+ChangeColor.h"

@implementation UIColor (ChangeColor)

+ (UIColor *)colorWithString:(NSString *)colorString
{
    NSString *colorName = [NSString stringWithFormat:@"%@Color", colorString];
    
    if ([colorString isEqualToString:@"red"])
    {
        return [UIColor redColor];
    }
    else if ([colorString isEqualToString:@"blue"])
    {
        return [UIColor blueColor];
    }
    else if ([colorString isEqualToString:@"yellow"])
    {
        return [UIColor yellowColor];
    }
    else if ([colorString isEqualToString:@"green"])
    {
        return [UIColor greenColor];
    }
    else if ([colorString isEqualToString:@"cyan"])
    {
        return [UIColor cyanColor];
    }
    
    return nil;
}



@end
