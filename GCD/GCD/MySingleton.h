//
//  MySingleton.h
//  GCD
//
//  Created by Greg Tropino on 10/17/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject

-(void)describe;
+(MySingleton *) sharedInstance;

@end
