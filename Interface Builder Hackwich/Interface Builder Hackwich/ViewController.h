//
//  ViewController.h
//  Interface Builder Hackwich
//
//  Created by Greg Tropino on 9/18/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *pressButton2;
- (IBAction)pressButton2:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *secondScreen;
- (IBAction)secondScreen:(id)sender;

- (IBAction)button:(id)sender;
@end
