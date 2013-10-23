//
//  DefaultPinView.m
//  MappingMappingChallenge
//
//  Created by Greg Tropino on 10/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "DefaultPinView.h"

@implementation DefaultPinView
{
    id observer;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(20, 20), NO, 0.0);
        [[UIImage imageNamed:@"metraimage.png"] drawInRect:CGRectMake(0, 0, 20, 20)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.image = newImage;
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        observer = [nc addObserverForName:@"ChangePins" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note)
                    {
                        NSLog(@"Sunny Galore!!!");
                        UIGraphicsBeginImageContextWithOptions(CGSizeMake(20, 20), NO, 0.0);
                        [[UIImage imageNamed:note.object] drawInRect:CGRectMake(0, 0, 20, 20)];
                        UIImage *newImage2 = UIGraphicsGetImageFromCurrentImageContext();
                        UIGraphicsEndImageContext();
                        self.image = newImage2;
                    }];
    }
    return self;
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
