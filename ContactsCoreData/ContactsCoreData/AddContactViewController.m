//
//  AddContactViewController.m
//  ContactsCoreData
//
//  Created by Greg Tropino on 10/16/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "AddContactViewController.h"

@interface AddContactViewController ()

@end

@implementation AddContactViewController

@synthesize firstNameTextField, lastNameTextField, emailTextField, streetField, street2Field, stateField, cityField, zipField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    firstNameTextField.text = [self.currentPerson firstName];
    lastNameTextField.text = [self.currentPerson lastName];
    emailTextField.text = [self.currentPerson emailAddress];
    streetField.text = self.currentPerson.address.streetAddress;
    street2Field.text = self.currentPerson.address.streetAddress2;
    cityField.text = self.currentPerson.address.cityName;
    stateField.text = self.currentPerson.address.stateName;
    zipField.text = self.currentPerson.address.zipCode;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedCancelButton:(id)sender
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pressedCancel" object:[self currentPerson]];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)pressedSaveButton:(id)sender
{
    [self.currentPerson setFirstName:firstNameTextField.text];
    [self.currentPerson setLastName:lastNameTextField.text];
    [self.currentPerson setEmailAddress:emailTextField.text];
    
    [[self.currentPerson address] setStreetAddress:streetField.text];
    [[self.currentPerson address] setStreetAddress2:street2Field.text];
    [[self.currentPerson address] setCityName:cityField.text];
    [[self.currentPerson address] setStateName:stateField.text];
    [[self.currentPerson address] setZipCode:zipField.text];
    
    AppDelegate *ad = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    [ad saveContext];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pressedSave" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
