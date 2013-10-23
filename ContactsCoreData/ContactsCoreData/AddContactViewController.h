//
//  AddContactViewController.h
//  ContactsCoreData
//
//  Created by Greg Tropino on 10/16/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"


@interface AddContactViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *streetField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *zipField;
@property (weak, nonatomic) IBOutlet UITextField *street2Field;

@property (strong, nonatomic) Person *currentPerson;

- (IBAction)pressedCancelButton:(id)sender;
- (IBAction)pressedSaveButton:(id)sender;

@end
