//
//  WordClass.h
//  WordBrowser
//
//  Created by Greg Tropino on 10/2/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordClass : NSObject


@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *definition;
@property (strong, nonatomic) NSString *synonym1;
@property (strong, nonatomic) NSString *synonym2;

@property (strong, nonatomic) NSMutableArray *synonym;

-(id)initWithName:(NSString*)newWord addDefinition:(NSString *)newDefinition addSynonym:(NSString *)newSynonym addSecondSynonym:(NSString *)newSecondSynonym;


@end
