//
//  main.m
//  ConditionalCode
//
//  Created by Greg Tropino on 9/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        int hurricaneCategory = 5;
        
        switch (hurricaneCategory) {
            case 0:
                NSLog(@"Hurricane, what hurricane?");
                break;
            case 1:
                NSLog(@"The hurricane is a category 1!");
                break;
            case 2:
                NSLog(@"The hurricane is a category 2!");
                break;
            case 3:
                NSLog(@"The hurricane is a category 3, hope you're hidden!");
                break;
            case 4:
                NSLog(@"The hurricane is a category 4, praying wouldn't hurt!");
                break;
            case 5:
                NSLog(@"The hurricane is a category 5, you'll be seeing Dorothy soon!");
                break;
        }

    }
    return 0;
}

