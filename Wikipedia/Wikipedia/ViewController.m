//
//  ViewController.m
//  Wikipedia
//
//  Created by Greg Tropino on 10/3/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableDictionary *wikis;
    NSDictionary *temp1;
    NSArray *temp2;
    NSArray *tempArray;
    NSMutableDictionary *searchDictionary;

}
@end

@implementation ViewController

@synthesize tableView, textFieldSearch;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"https://en.wikipedia.org/w/api.php?%20action=query&list=search&srsearch=SEARCH_TERM_GOES_HERE&srprop=snippet&format=json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         wikis = [NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
         

         temp1 = [wikis objectForKey:@"query"];
         temp2 = [temp1 objectForKey:@"search"];
         NSMutableDictionary *tempDictionary;
         searchDictionary = [NSMutableDictionary new];
         for (int i = 0; i < [temp2 count]; i++)
         {
             tempDictionary = temp2[i];
             NSString *title = [tempDictionary objectForKey:@"title"];
             NSString *snippet = [tempDictionary objectForKey:@"snippet"];
             [searchDictionary setObject:snippet forKey:title];

    
         }
         NSLog(@"%@", [searchDictionary objectForKey:@"Sarah Palin"]);
         [tableView reloadData];

//         tempArray = [NSArray new];
//         tempArray = [temp2 allKeys].mutableCopy;
         
         NSLog(@"Inside the block");
     }];
    
    NSLog(@"Outside the block");
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"abc"];

    cell.textLabel.text = [NSString stringWithFormat:@"%@", searchDictionary.allKeys[indexPath.row]];

    
 //   NSLog(@"%@", tempArray[indexPath.row]);
 //   NSLog(@"%@,",[NSString stringWithFormat:@"%i", [temp2 count]]);
//    NSLog(@"%@,", [temp2 objectForKey:@"title"]);
 //  NSLog(@"%@,", [temp1 objectForKey:@"search"]);  //  Winner winnner chicken dinner
 //   NSLog(@"%@,", [temp1 objectForKey:@"searchinfo"]);
 //   NSLog(@"%@", [searchDictionary allKeys]);
 //   tempDict = searchDictionary[indexPath.row];
   // cell.textLabel.text = [searchDictionary allKeys];
    
   // cell.detailTextLabel.text = [(NSDictionary *)[superheroes objectAtIndex:indexPath.row] objectForKey:@"description"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [searchDictionary count];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    NSString *key = [NSString stringWithFormat:@"%@", searchDictionary.allKeys[indexPath.row]];
    NSLog(@"%@", [NSString stringWithFormat:@"%@", searchDictionary.allKeys[indexPath.row]]);
    SecondViewController *svc = segue.destinationViewController;
    
  //  svc.labelTitle.text = [NSString stringWithFormat:@"%@", word.title];
  //  svc.labelSnippet.text = [NSString stringWithFormat:@"%@", word.snippet];
}



- (IBAction)pressedSearchButton:(id)sender
{
    NSString *tempString = textFieldSearch.text;
    NSLog(@"%@", tempString);
    NSString *string = @"hello bla bla";
    if ([tempString rangeOfString:@"bla"].location == NSNotFound) {
        NSLog(@"string does not contain bla");
    } else {
        NSLog(@"string contains bla!");
    }
}
@end
