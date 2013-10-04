//
//  ViewController.m
//  BlocksChallenge
//
//  Created by Greg Tropino on 10/1/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

typedef NSMutableArray *(^MMFilterArrayType)();

@interface ViewController ()
{
    MMFilterArrayType filterBlock;
}
@end




@implementation ViewController

@synthesize evenButton, oddButton, numbersArray, tableViewShowAll, evenNumbersArray, oddNumbersArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    numbersArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 50; i++) {
        [numbersArray addObject:[NSNumber numberWithInt:i]];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"firstSegue"])
    {
    SecondViewController *filterView = segue.destinationViewController;
    filterView.showingFilteredView = filterBlock();
    }
    
    if ([segue.identifier isEqualToString:@"thresholdSegue"])
    {
    ThresholdViewController *thresholdVC = segue.destinationViewController;
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [numbersArray count];
}


-(UITableViewCell *)tableView:(UITableView *)z cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableViewShowAll dequeueReusableCellWithIdentifier:@"aaa"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aaa"];
    }
    cell.textLabel.text =  [NSString stringWithFormat:@"%i", [[numbersArray objectAtIndex:indexPath.row] integerValue]];
    
    return cell;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


/*
 int evenArrayIndex = 0;
 int oddArrayIndex = 0;
 
 for (int x = 0; x < [numbersArray count]; x++)
 {
 int tempNumberComparison = [[numbersArray objectAtIndex:x] integerValue];
 tempNumberComparison = (tempNumberComparison % 2);
 if (tempNumberComparison == 0)
 {
 evenNumbersArray[evenArrayIndex] = [numbersArray objectAtIndex:x];
 evenArrayIndex++;
 } else {
 oddNumbersArray[oddArrayIndex] = [numbersArray objectAtIndex:x];
 oddArrayIndex++;
 }
 }
 */


- (IBAction)pressedThresholdButton:(id)sender
{
    [self performSegueWithIdentifier:@"thresholdSegue" sender:self];
}



- (IBAction)pressedEvenButton:(id)sender
{
    NSMutableArray *filteredArray = [NSMutableArray new];

    if (sender == evenButton)
    {
        filterBlock = ^{
            for (int x = 0; x < numbersArray.count; ++x) {
                if ([numbersArray[x] intValue] % 2 == 0)
                    [filteredArray addObject:numbersArray[x]];
            }
            return filteredArray;
        };
    }
    else if (sender == oddButton){
        filterBlock = ^{
            for (int x = 0; x < numbersArray.count; ++x) {
                if ([numbersArray[x] intValue] % 2 == 1)
                    [filteredArray addObject:numbersArray[x]];
            }
            return filteredArray;
        };
    } else {
        filterBlock = ^{
            for (int x = 0; x < numbersArray.count; ++x) {
                if ([numbersArray[x] intValue] < 5)
                    [filteredArray addObject:numbersArray[x]];
            }
            return filteredArray;
        };
    }
    [self performSegueWithIdentifier:@"firstSegue" sender:self];
}



@end
