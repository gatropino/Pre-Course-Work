//
//  ViewController.m
//  BlocksWithAppleMethods
//
//  Created by Greg Tropino on 10/2/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    
    Person *person1 = [Person new];
    person1.firstName = @"Max";
    person1.lastName = @"Howell";
    [dict setObject:person1 forKey:@"H"];
    
    Person *person2 = [Person new];
    person2.firstName = @"Ryan";
    person2.lastName = @"Striker";
    [dict setObject:person2 forKey:@"S"];
    
    Person *person3 = [Person new];
    person3.firstName = @"Roger";
    person3.lastName = @"Smith";
    [dict setObject:person3 forKey:@"S"];

   // NSLog(@"%@", dict);
    
    
//    [dict setObject:@[person2, person3] forKey:@"S"];  these two lines perform the same action
//    dict [@"S"] = @[person2, person3];
    
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, Person *person, BOOL *stop) {
        NSLog(@"%@: %@ %@", key, person.firstName, person.lastName);
    }];
}

/*
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *people = [NSMutableArray new];
    
    Person *person1 = [Person new];
    person1.firstName = @"Jonny";
    person1.lastName = @"Vitarro";
    [people addObject:person1];
    
    Person *person2 = [Person new];
    person2.firstName = @"Olly Olly";
    person2.lastName = @"Oxinfree";
    [people addObject:person2];

    Person *person3 = [Person new];
    person3.firstName = @"Big";
    person3.lastName = @"Dave";
    [people addObject:person3];

    Person *person4 = [Person new];
    person4.firstName = @"Billy";
    person4.lastName = @"Bob";
    [people addObject:person4];
    
    Person *person5 = [Person new];
    person5.firstName = @"Daffy";
    person5.lastName = @"Duck";
    [people addObject:person5];

    Person *person6 = [Person new];
    person6.firstName = @"Hughey";
    person6.lastName = @"Duck";
    [people addObject:person6];

    [people sortUsingComparator:^NSComparisonResult(Person *obj1, Person *obj2) {
        
        int lastNameOrder = [obj1.lastName compare:obj2.lastName];
        
        if (lastNameOrder == NSOrderedSame) {
            return  [obj1.firstName compare:obj2.firstName];
        } else {
            return lastNameOrder;
        }
        }];

    
//    for (Person *person in people){
//        NSLog(@"Person %@ %@", person.firstName, person.lastName);        can use this method or the enumerate below
//        }

        [people enumerateObjectsUsingBlock:^(Person *person, NSUInteger idx, BOOL *stop) {
            NSLog(@"Person %d %@ %@", idx, person.firstName, person.lastName);
        }];
}
*/


//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    NSArray *things = @[@"b", @"a", @"c"];
//    NSLog(@"Array before sorting %@", things);
//    
//    NSArray *sortedThings = [things sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        return  [obj1 compare:obj2];
//    }];
//    
//    NSLog(@"Array after sorting %@", sortedThings);
//}


@end
