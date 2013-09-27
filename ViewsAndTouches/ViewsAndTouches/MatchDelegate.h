//
//  MatchDelegate.h
//  ViewsAndTouches
//
//  Created by Greg Tropino on 9/26/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyView.h"

@protocol MatchDelegate <NSObject>

-(void) didChooseView: (MyView *)view;

@end
