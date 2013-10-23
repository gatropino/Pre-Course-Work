//
//  ViewController.m
//  AppNet
//
//  Created by Greg Tropino on 10/5/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableDictionary *dictFirst, *dictPosts;
    NSArray *temp1;
}

@end

@implementation ViewController

@synthesize labelLoading, activityIndicator, tableView;

- (void)initializeTableAfterLoad:(NSDictionary *)tempDict
{
    temp1 = [tempDict objectForKey:@"data"];
    NSMutableDictionary *tempDictionary;
    dictPosts = [NSMutableDictionary new];
    for (int i = 0; i < [temp1 count]; i++)
    {
        tempDictionary = temp1[i];
        NSString *text = [tempDictionary objectForKey:@"text"];
        NSString *user = [tempDictionary objectForKey:@"text"];
        [dictPosts setObject:text forKey:user];
    }
    [tableView reloadData];
    NSLog(@"%@", [dictPosts allKeys]);
   // NSLog(@"%@", [dictPosts objectForKey:@"user"]);

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [activityIndicator setHidden:NO];
    [labelLoading setHidden:NO];
    [activityIndicator startAnimating];
    
    NSURL *url = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         dictFirst = [NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
         [activityIndicator setHidden:YES];
         [labelLoading setHidden:YES];
         [activityIndicator stopAnimating];
         [self initializeTableAfterLoad:dictFirst];
         NSLog(@"%@", [dictFirst allKeys]);
     }];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView2 dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", dictPosts.allKeys[indexPath.row]];
    
    
        NSLog(@"%@", [dictFirst allKeys]);
        NSLog(@"%@", temp1[indexPath.row]);
        NSLog(@"%@,",[NSString stringWithFormat:@"%i", [temp1 count]]);
        NSLog(@"%@,", [dictPosts objectForKey:@"user"]);
        NSLog(@"%@,", [dictPosts objectForKey:@"text"]);  //  Winner winnner chicken dinner
     //   NSLog(@"%@,", [temp1 objectForKey:@"searchinfo"]);
        NSLog(@"%@", [dictPosts allKeys]);
    //   tempDict = searchDictionary[indexPath.row];
    // cell.textLabel.text = [searchDictionary allKeys];
    
    // cell.detailTextLabel.text = [(NSDictionary *)[superheroes objectAtIndex:indexPath.row] objectForKey:@"description"];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"test");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dictPosts count];
}


@end
