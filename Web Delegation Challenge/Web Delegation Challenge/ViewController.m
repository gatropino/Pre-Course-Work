//
//  ViewController.m
//  Web Delegation Challenge
//
//  Created by Greg Tropino on 9/23/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)enteredText:(id)sender;

@end

@implementation ViewController

@synthesize delegateURL;
@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

   webView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)convertTextToURL:(NSString *)Text
{
    NSURLRequest *request;
    NSURL *url;
    
    url = [NSURL URLWithString: [NSString stringWithFormat:@"%@", Text]];
           request = [NSURLRequest requestWithURL:url];
           [webView loadRequest:request];
}

-(BOOL)textFieldShouldReturn:(UITextField *) textField
{
    NSString *enteredURL = _urlTextField.text;
    NSLog(@"%@", enteredURL);
    
   [delegateURL convertTextToURL:enteredURL];
    //[ convertTextToURL:text];
    [_urlTextField resignFirstResponder];
    
    return YES;
}

- (IBAction)enteredText:(id)sender {
}
@end
/*
1. Add a UITextField to enter a URL into your web browser
2. Add a back and forward button to your web browser
3. Add a UIActivityIndicator, start and stop it based on UIWebView delegate methods

*/