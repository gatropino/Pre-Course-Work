//
//  ViewController.h
//  ViewFunHouse
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property UIImageView *logoBlackWhite;
@property UISlider    *slider;
@property UIButton    *mathButton;
@property UIButton    *onOffButton;
@property UILabel     *sliderLabel;


- (IBAction)onOff:(id)sender;
- (IBAction)pressedMathButton:(id)sender;
- (IBAction)sliderValueChange:(id)sender;
- (IBAction)colorizeButton:(id)sender;

@end
