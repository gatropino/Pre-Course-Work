//
//  ViewController.h
//  CalculatorWithBlocks
//
//  Created by Greg Tropino on 10/1/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSecondNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelTotalOfNumbers;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *subtractButton;
@property (weak, nonatomic) IBOutlet UIButton *divideButton;
@property (weak, nonatomic) IBOutlet UIButton *multiplyButton;
@property (weak, nonatomic) IBOutlet UILabel *labelCalculationType;

- (IBAction)pressedAddButton:(id)sender;

@end
