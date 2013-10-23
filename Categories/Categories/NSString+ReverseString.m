//
//  NSString+ReverseString.m
//  Categories
//
//  Created by Greg Tropino on 10/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "NSString+ReverseString.h"

@implementation NSString (ReverseString)

-(NSString *)reverseString
{
    NSString *text = self;
    
    NSMutableArray *reversedChars = [NSMutableArray new];
    
    for (int i = text.length -1; i >= 0; i--) {
        NSRange range = NSMakeRange(i, 1);
        NSString *letter = [text substringWithRange:range];
        [reversedChars addObject:letter];
    }
    
    NSString *reversedString = [reversedChars componentsJoinedByString:@""];

    return reversedString;
}

@end
