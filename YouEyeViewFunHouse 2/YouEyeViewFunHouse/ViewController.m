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
    
    UIButton *changeMyColorButton;
    UIButton *moveMeButton;
    UIButton *onOffButton;
    UIButton *mathButton;
    UIButton *invisibleButton;
    UISlider *slider;
    UIImageView *logoView;
    UILabel     *sliderLabel;
        
    
    // Button - Change my color button set up
    CGRect colorBtnRect         = CGRectMake(87, 12, 146, 36);
    changeMyColorButton         = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    changeMyColorButton.frame   = colorBtnRect;
    [changeMyColorButton setTitle:@"Change my color"
                         forState:UIControlStateNormal];
    [changeMyColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    changeMyColorButton.tintColor = [UIColor purpleColor];

    
    // Button - Move me down and make me bigger
    CGRect moveBtnRect  = CGRectMake(20, 56, 280, 36);
    moveMeButton        = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    moveMeButton.frame  = moveBtnRect;
    [moveMeButton setTitle:@"Move me down and make me bigger"
                  forState:UIControlStateNormal];
    
    // Button - OnOff
    CGRect onOffBtnRect     = CGRectMake(124, 98, 74, 34);
    onOffButton        = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    onOffButton.frame  = onOffBtnRect;
    [onOffButton setTitle:@"On"
                      forState:UIControlStateNormal];
    
    // Button - Math 
    CGRect mathBtnRect      = CGRectMake(236, 250, 64, 44);
    mathButton         = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    mathButton.frame   = mathBtnRect;
    [mathButton setTitle:@"Math"
                     forState:UIControlStateNormal];
    
    // Button - Invisible colorize button
    CGRect invisibleBtnRect = CGRectMake(70, 320, 174, 174);
    invisibleButton         = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    invisibleButton.frame   = invisibleBtnRect;
    invisibleButton.alpha   = 0.0;
    
    // Slider - slider
    CGRect sliderRect = CGRectMake(10, 206, 300, 24);
    slider = [[UISlider alloc] initWithFrame:sliderRect];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    
    // ImageView - Logo
    CGRect logoRect = CGRectMake(70, 320, 174, 174);
    logoView = [[UIImageView alloc] initWithFrame:logoRect];
    logoView.image = [UIImage imageNamed:@"MobileMakersLogo_black_and_white.png"];
    
    // Label - sliderLabel
    CGRect labelRect = CGRectMake(10, 160, 300, 30);
    sliderLabel = [[UILabel alloc] initWithFrame:labelRect];
    sliderLabel.text = [NSString stringWithFormat:@"Value: %f",slider.value];
    
    
    
    [self.view addSubview:changeMyColorButton];
    [self.view addSubview:moveMeButton];
    [self.view addSubview:onOffButton];
    [self.view addSubview:mathButton];
    [self.view addSubview:invisibleButton];
    [self.view addSubview:slider];
    [self.view addSubview:logoView];
    
    
}

/*
 
 
 float sliderVal;
 
 sliderVal = self.slider.value;
 
 _sliderLabel.text = [NSString stringWithFormat:@"value %2f", sliderVal];


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
    if ( [_onOffButton.titleLabel.text isEqualToString: @"On" ])
        {
        [_onOffButton setTitle:@"Off" forState:UIControlStateNormal];
        }
    else [_onOffButton setTitle:@"On" forState:UIControlStateNormal];
   
}
    
- (IBAction)pressedMathButton:(id)sender
{
    int x, y;

    x = [_firstIntegerLabel.text intValue];
    y = [_secondIntegerLabel.text intValue];
    
    int z= x+y;

    _mathTotalLabel.text = [NSString stringWithFormat:@"%i", z];
}
 
*/
 
@end
