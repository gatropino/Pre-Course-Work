//
//  ViewController.m
//  CalculatorWithBlocks
//
//  Created by Greg Tropino on 10/1/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

typedef float (^mathType)();

@implementation ViewController

@synthesize textFieldFirstNumber, textFieldSecondNumber, labelTotalOfNumbers, addButton, subtractButton, divideButton, multiplyButton, labelCalculationType;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pressedAddButton:(id)sender
{

    float numberOne = textFieldFirstNumber.text.integerValue;
    float numberTwo = textFieldSecondNumber.text.integerValue;
    
    if (sender == subtractButton)
    {
        [self updateLabelWithResultOfBlock:^(){
            labelCalculationType.text = @"-";
            return numberOne - numberTwo;
        }];
    } else if (sender == addButton){
        [self updateLabelWithResultOfBlock:^{
            labelCalculationType.text = @"+";
            return  numberOne + numberTwo;
        }];
    } else if (sender == divideButton){
        [self updateLabelWithResultOfBlock:^{
            float x = (float)numberOne/numberTwo;
            labelCalculationType.text = @"/";
            return x;
        }];
    } else if (sender ==multiplyButton){
        [self updateLabelWithResultOfBlock:^{
            labelCalculationType.text = @"*";
            return  numberOne * numberTwo;
        }];
    } else{
        NSLog(@"SOMETHING WENT HORRIBLY WRONG WITH IDENTIFYING BUTTON!!!");
    }
}

-(void) updateLabelWithResultOfBlock:(mathType) block
{
    labelTotalOfNumbers.text = [NSString stringWithFormat:@"= %.2f", block()];
}


@end
