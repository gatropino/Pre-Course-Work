//
//  ViewController.m
//  ViewFunHouse
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float sliderVal;
        
    sliderVal = self.slider.value;
    
    _sliderLabel.text = [NSString stringWithFormat:@"value %2f", sliderVal];
}


- (IBAction)sliderValueChange:(id)sender {
    
    float sliderVal;
    NSString *sliderValue;
    
    sliderVal = self.slider.value;
    sliderValue = [NSString stringWithFormat:@"value %2f", sliderVal];
    
    _sliderLabel.text = sliderValue;
}

- (IBAction)colorizeButton:(id)sender {
    
    if (self.logoBlackWhite.image == [UIImage imageNamed:@"MobileMakersLogo_black_and_white.png"])
        {
        self.logoBlackWhite.image = [UIImage imageNamed:@"MobileMakersLogo_color.png"];
        }
    else (self.logoBlackWhite.image = [UIImage imageNamed:@"MobileMakersLogo_black_and_white.png"]);
    
}
- (IBAction)onOff:(id)sender
{
    if ( [_onOff.titleLabel.text isEqualToString: @"On" ])
        {
        [_onOff setTitle:@"Off" forState:UIControlStateNormal];
        }
    else [_onOff setTitle:@"On" forState:UIControlStateNormal];
   
}
    
- (IBAction)pressedMathButton:(id)sender {
    int x;
    int y;
    x = [_firstInteger.text intValue];
    y = [_secondInteger.text intValue];
    int z= x+y;

    _mathTotal.text = [NSString stringWithFormat:@"%i", z];
}
@end
