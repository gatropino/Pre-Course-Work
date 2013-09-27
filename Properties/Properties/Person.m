//
//  Person.m
//  Properties
//
//  Created by Greg Tropino on 9/19/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name;

@synthesize salary;

@synthesize netsalary;

-(float) netsalary {
    
    return salary - (salary *0.15);
    
} return

//-(void)setName:(NSString *)_name {
//    name = _name;
//}

@end
