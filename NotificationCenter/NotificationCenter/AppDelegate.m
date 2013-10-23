//
//  AppDelegate.m
//  NotificationCenter
//
//  Created by Greg Tropino on 10/9/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    id url = @"http://www.google.com";
    url = [NSURL URLWithString:url];
    id request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Downloaded Google" object:data];
    }];
    return YES;
}
							

@end
