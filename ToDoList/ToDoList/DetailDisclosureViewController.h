//
//  DetailDisclosureViewController.h
//  ToDoList
//
//  Created by Greg Tropino on 9/24/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateChangeDisclosure.h"

@interface DetailDisclosureViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *enterCellChange;

@property (strong, nonatomic) NSString *text;

@property (weak, nonatomic) id <DetailDisclosureViewControllerDelegate> delegate;

@property (nonatomic) NSInteger index;

- (IBAction)pressedDoneEditing:(id)sender;

@end
