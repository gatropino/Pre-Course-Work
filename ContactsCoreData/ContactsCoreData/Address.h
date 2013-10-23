//
//  Address.h
//  ContactsCoreData
//
//  Created by Greg Tropino on 10/17/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Address : NSManagedObject

@property (nonatomic, retain) NSString * streetAddress;
@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) NSString * stateName;
@property (nonatomic, retain) NSString * zipCode;
@property (nonatomic, retain) NSString * streetAddress2;
@property (nonatomic, retain) Person *person;

@end
