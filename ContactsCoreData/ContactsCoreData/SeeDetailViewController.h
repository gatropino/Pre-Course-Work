//
//  SeeDetailViewController.h
//  ContactsCoreData
//
//  Created by Greg Tropino on 10/16/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "AppDelegate.h"
#import "Address.h"

@interface SeeDetailViewController : UIViewController

@property (strong, nonatomic) Person *currentPerson;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *streetField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *zipField;
@property (weak, nonatomic) IBOutlet UITextField *street2Field;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

- (IBAction)pressedEditButton:(id)sender;
- (IBAction)pressedDoneButton:(id)sender;

@end
