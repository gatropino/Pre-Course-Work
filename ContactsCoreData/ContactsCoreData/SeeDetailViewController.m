//
//  SeeDetailViewController.m
//  ContactsCoreData
//
//  Created by Greg Tropino on 10/16/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "SeeDetailViewController.h"

@interface SeeDetailViewController ()

@end

@implementation SeeDetailViewController

@synthesize firstNameField, lastNameField, emailField, currentPerson, doneButton, editButton, stateField, streetField, street2Field, cityField, zipField;

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
    doneButton.hidden = YES;
    
    firstNameField.text = [currentPerson firstName];
    lastNameField.text = [currentPerson lastName];
    emailField.text = [currentPerson emailAddress];
    streetField.text = self.currentPerson.address.streetAddress;
    street2Field.text = self.currentPerson.address.streetAddress2;
    cityField.text = self.currentPerson.address.cityName;
    stateField.text = self.currentPerson.address.stateName;
    zipField.text = self.currentPerson.address.zipCode;
    
    firstNameField.enabled = NO;
    lastNameField.enabled = NO;
    emailField.enabled = NO;
    streetField.enabled = NO;
    street2Field.enabled = NO;
    stateField.enabled = NO;
    cityField.enabled = NO;
    zipField.enabled = NO;
}

- (IBAction)pressedEditButton:(id)sender
{
    firstNameField.enabled = YES;
    lastNameField.enabled = YES;
    emailField.enabled = YES;
    streetField.enabled = YES;
    street2Field.enabled = YES;
    stateField.enabled = YES;
    cityField.enabled = YES;
    zipField.enabled = YES;
    
    editButton.hidden = YES;
    doneButton.hidden = NO;
}

- (IBAction)pressedDoneButton:(id)sender
{
    firstNameField.enabled = NO;
    lastNameField.enabled = NO;
    emailField.enabled = NO;
    streetField.enabled = NO;
    street2Field.enabled = NO;
    stateField.enabled = NO;
    cityField.enabled = NO;
    zipField.enabled = NO;
    
    editButton.hidden = NO;
    doneButton.hidden = YES;
    
    currentPerson.firstName = firstNameField.text;
    currentPerson.lastName = lastNameField.text;
    currentPerson.emailAddress = emailField.text;
    
    [[self.currentPerson address] setStreetAddress:streetField.text];
    [[self.currentPerson address] setStreetAddress2:street2Field.text];
    [[self.currentPerson address] setCityName:cityField.text];
    [[self.currentPerson address] setStateName:stateField.text];
    [[self.currentPerson address] setZipCode:zipField.text];
    
    AppDelegate *ad = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    [ad saveContext];
    
    [self.navigationController popViewControllerAnimated:YES];

}
@end
