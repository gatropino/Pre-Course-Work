//
//  Text to URL Delegate.h
//  Web Delegation Challenge
//
//  Created by Greg Tropino on 9/23/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Text_to_URL_Delegate <NSObject>

-(void)convertTextToURL:(NSString *) Text;

@end
