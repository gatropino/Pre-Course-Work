//
//  ViewController.h
//  Calculator
//
//  Created by Greg Tropino on 9/18/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstInput;
@property (weak, nonatomic) IBOutlet UITextField *secondInput;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UIButton *addTogether;
@property (weak, nonatomic) IBOutlet UIButton *minus;
@property (weak, nonatomic) IBOutlet UIButton *divis;
@property (weak, nonatomic) IBOutlet UIButton *multi;


- (IBAction)addTogether:(id)sender;
- (IBAction)minus:(id)sender;
- (IBAction)divis:(id)sender;
- (IBAction)multi:(id)sender;


@end
