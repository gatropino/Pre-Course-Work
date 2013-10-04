//
//  SecondViewController.h
//  WordBrowser
//
//  Created by Greg Tropino on 10/2/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelForWord;
@property (weak, nonatomic) IBOutlet UILabel *labelForDefinition;
@property (weak, nonatomic) IBOutlet UILabel *labelForSynonym1;
@property (weak, nonatomic) IBOutlet UILabel *labelForSynonym2;

@end
