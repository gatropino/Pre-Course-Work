//
//  BoringViewController.h
//  Delegates
//
//  Created by Greg Tropino on 9/23/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorDelegate.h"

@interface BoringViewController : UIViewController
- (IBAction)changeGreen:(id)sender;
- (IBAction)changeRed:(id)sender;

@property (strong, nonatomic) id <ColorDelegate> delegate;

@end
