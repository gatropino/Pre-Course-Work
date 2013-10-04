//
//  SecondViewController.h
//  CompletionBlock
//
//  Created by Greg Tropino on 10/2/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SecondViewControllerCompletionBlock)(int);

@interface SecondViewController : UIViewController

@property int numberOfCats;

@property (strong) SecondViewControllerCompletionBlock completionBlock;

@end
