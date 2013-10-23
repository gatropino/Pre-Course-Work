//
//  UIColorView.m
//  NotificationChallenge
//
//  Created by Greg Tropino on 10/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "UIColorView.h"
#import "UIColor+ChangeColor.h"

@interface UIColorView ()
{
    id observer;
}

@end

@implementation UIColorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)newColor:(NSNotification *)notification
{
    self.backgroundColor = [UIColor colorWithString:notification.object];
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    observer = [nc addObserverForName:@"ColorObserver" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [self newColor:note];
    }];
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}
@end
