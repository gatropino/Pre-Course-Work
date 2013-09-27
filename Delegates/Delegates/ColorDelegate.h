//
//  ColorDelegate.h
//  Delegates
//
//  Created by Greg Tropino on 9/23/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ColorDelegate <NSObject>

-(void)changeColor: (UIColor *) color;

@end