//
//  Person.h
//  Properties
//
//  Created by Greg Tropino on 9/19/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *name;

@property (nonatomic) float salary;

@property (readonly, nonatomic) float netsalary;



//-(void) setName:(NSString *)name;
//-(NSString *)name;

@end
