//
//  ViewController.h
//  Web Delegation Challenge
//
//  Created by Greg Tropino on 9/23/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Text to URL Delegate.h"

@interface ViewController : UIViewController <Text_to_URL_Delegate, UITextFieldDelegate, UIWebViewDelegate>

@property (strong, nonatomic)id<Text_to_URL_Delegate>delegateURL;

@end
