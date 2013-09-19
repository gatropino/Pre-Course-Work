//
//  ViewController.h
//  ViewFunHouse
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *mathButton;
@property (weak, nonatomic) IBOutlet UILabel *mathTotal;
@property (weak, nonatomic) IBOutlet UILabel *secondInteger;
@property (weak, nonatomic) IBOutlet UILabel *firstInteger;
@property (weak, nonatomic) IBOutlet UIImageView *logoBlackWhite;
@property (weak, nonatomic) IBOutlet UIButton *onOff;
@property (weak, nonatomic) IBOutlet UIButton *colorizeButton;


- (IBAction)onOff:(id)sender;
- (IBAction)pressedMathButton:(id)sender;
- (IBAction)sliderValueChange:(id)sender;
- (IBAction)colorizeButton:(id)sender;

@end
