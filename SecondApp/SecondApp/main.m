//
//  main.m
//  SecondApp
//
//  Created by Greg Tropino on 9/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int seconds = 60;
        int minutes = 60;
        int hours = 24;
        int days = 365;
        
        int secondsinayear = seconds * minutes * hours * days * 10;
        
        NSLog(@"There are %i seconds in a year.", secondsinayear);
        
    }
    return 0;
}

