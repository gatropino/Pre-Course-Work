//
//  ViewController.m
//  Hackwich3.2
//
//  Created by Greg Tropino on 10/1/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
/*
 int getFirstNumber(int firstNumber, int secondNumber)
 {
 return firstNumber + secondNumber;       c style
 }
 */
@interface ViewController ()

@end

//typedef int (^mathType)(int, int);  // basically says that it will return an int, and take two ints as parameters

typedef int (^mathType)();          //only changed for optimization

@implementation ViewController

@synthesize textFieldFirstNumber, textFieldSecondNumber, labelFieldTotal, addNumberButton, subtractNumberButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 -(int) getFirstNumber: (int) firstNumber getSecondNumber: (int) secondNumber
 {
 return firstNumber + secondNumber;        objective c style
 }
 */

- (IBAction)pressedAddNumbersButton:(id)sender
{
    //int total = [self getFirstNumber:textFieldFirstNumber.text.integerValue getSecondNumber:textFieldSecondNumber.text.integerValue]; objectice c style
    
    //int total = getFirstNumber(textFieldFirstNumber.text.integerValue, textFieldSecondNumber.text.integerValue); c style
    
    // int (^getFirstNumber)(int, int) = ^(int firstNumber, int secondNumber)     block style without typedef
    
    //int total = getFirstNumber(textFieldFirstNumber.text.integerValue, textFieldSecondNumber.text.integerValue);  block style
/*
    mathType getFirstNumber = ^(int firstNumber, int secondNumber)     //block style with typedef to make it more readible
    {
        return firstNumber + secondNumber;
    };
    
    mathType subtractNumber = ^(int firstNumber, int secondNumber)     //block style with typedef to make it more readible
    {
        return firstNumber - secondNumber;
    };
    
    mathType block = nil;
    
    if (sender == subtractNumberButton)
    {
        block = subtractNumber;
    } else {
        block = getFirstNumber;
    }
    
    int total = [self doMathWithNumber:textFieldFirstNumber.text.integerValue otherNumber:textFieldSecondNumber.text.integerValue withBlock:block];
    
    labelFieldTotal.text = [NSString stringWithFormat:@"%i", total];
    */
    
    int numberOne = textFieldFirstNumber.text.integerValue;
    int numberTwo = textFieldSecondNumber.text.integerValue;
    
    if (sender == subtractNumberButton)
    {
        [self updateLabelWithResultOfBlock:^(){
            return numberOne - numberTwo;
        }];
    } else {
        [self updateLabelWithResultOfBlock:^{
            return  numberOne + numberTwo;
        }];
    }

}

-(void) updateLabelWithResultOfBlock:(mathType) block
{
    labelFieldTotal.text = [NSString stringWithFormat:@"%i", block()];
}

/*
-(int) doMathWithNumber:(int)numberOne otherNumber:(int)numberTwo withBlock:(mathType) block
{
    return block (numberOne, numberTwo);    kept until end optimization
}
*/
@end
