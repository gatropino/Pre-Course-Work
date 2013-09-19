//
//  MagicEightBall.m
//  MagicEightBall
//
//  Created by Greg Tropino on 9/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "MagicEightBall.h"
@interface MagicEightBall () {
    NSArray *choices;
}
@end

@implementation MagicEightBall

-(NSString *) magicEightBallOutputs {
    
    choices = @[@"yes", @"no", @"maybe"];
    
    return [choices objectAtIndex:arc4random() % 3];
}
@end
