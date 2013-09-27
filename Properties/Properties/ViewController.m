//
//  ViewController.m
//  Properties
//
//  Created by Greg Tropino on 9/19/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *myTextField;
    __weak IBOutlet UILabel *myLabel;
    __weak IBOutlet UILabel *myLabel2;
    __weak IBOutlet UITextField *myTextField2;
    Person *person;
    Person *person2;

}

- (IBAction)buttonPressed:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    person = [[Person alloc] init];
    person2 = [[Person alloc] init];
    person.name = @"Greg";
//  [person setName:@"Greg"]; Performing it this way you can not tell if its a property or an object, where as with the .name you know its a property
    person.salary = 10000;
    person2.salary = 15000;
    myLabel.text = person.name;
    myLabel2.text = person2.name;
    
    NSLog(@"The first persons salary is %f", person.salary);
    NSLog(@"The second persons salary is %f", person2.salary);
    
    NSLog(@"The first persons netsalary is %f", person.netsalary);
    NSLog(@"The second persons netsalary is %f", person2.netsalary);


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {

    if (sender.tag == 1) {
    
    person.name = myTextField.text;
    myLabel.text = person.name;
    } else {
    
    person2.name = myTextField2.text;
    myLabel2.text = person2.name;
    }
}
@end
