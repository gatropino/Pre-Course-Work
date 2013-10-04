//
//  ViewController.m
//  APIWork
//
//  Created by Greg Tropino on 10/3/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *superheroes;
}

@end

@implementation ViewController

@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
/*    
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
*/
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        superheroes = [NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
        
        [tableView reloadData];
/*
        NSMutableString *superHeroString = [[NSMutableString alloc] init];
 
        for (NSDictionary *superHeroDictionary in responseArray) {
            NSString *name = [superHeroDictionary objectForKey:@"name"];
            NSString *description = [superHeroDictionary objectForKey:@"description"];
            
            [superHeroString appendFormat:@"%@\n%@\n\n", name, description];
 
        }
        self.textView.text = superHeroString;  */
        NSLog(@"Inside the block");
     }];
    
    NSLog(@"Outside the block");
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"abc"];
    
    cell.textLabel.text = [(NSDictionary *)[superheroes objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    cell.detailTextLabel.text = [(NSDictionary *)[superheroes objectAtIndex:indexPath.row] objectForKey:@"description"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [superheroes count];
}


@end
