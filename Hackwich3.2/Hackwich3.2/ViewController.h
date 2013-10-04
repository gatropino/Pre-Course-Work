//
//  ViewController.h
//  Hackwich3.2
//
//  Created by Greg Tropino on 10/1/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSecondNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelFieldTotal;
@property (weak, nonatomic) IBOutlet UIButton *addNumberButton;
@property (weak, nonatomic) IBOutlet UIButton *subtractNumberButton;


- (IBAction)pressedAddNumbersButton:(id)sender;

@end
