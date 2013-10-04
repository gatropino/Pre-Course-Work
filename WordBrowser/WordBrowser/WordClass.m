//
//  WordClass.m
//  WordBrowser
//
//  Created by Greg Tropino on 10/2/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "WordClass.h"

@implementation WordClass

@synthesize name, definition, synonym1, synonym2;

-(id)initWithName:(NSString *)newWord addDefinition:(NSString *)newDefinition addSynonym:(NSString *)newSynonym addSecondSynonym:(NSString *)newSecondSynonym
{
    self = [super init];
    {
        name = newWord;
        definition = newDefinition;
        synonym1 = newSynonym;
        synonym2 = newSecondSynonym;
    }
    
    return self;
}

-(id) init
{
    return [self initWithName:@"Unknown" addDefinition:@"Unknown" addSynonym:@"Unknown" addSecondSynonym:@"Unknown"];
}

- (id)description {
    return [NSString stringWithFormat:@"%@ %@ %@ %@", name, definition, synonym1, synonym2];
}

@end
