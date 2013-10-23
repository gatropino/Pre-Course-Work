//
//  ViewController.h
//  Categories
//
//  Created by Greg Tropino on 10/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
- (IBAction)pressedButton:(id)sender;

@end
