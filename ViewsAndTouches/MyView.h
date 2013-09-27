//
//  MyView.h
//  ViewsAndTouches
//
//  Created by Greg Tropino on 9/26/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MatchDelegate <NSObject>

-(void) didChooseView: (UIView *)view tagOfView:(int)currentTag;

@end

@interface MyView : UIView

@property (strong, nonatomic) id<MatchDelegate> delegate;

@end
