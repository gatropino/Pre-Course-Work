//
//  ViewController.m
//  WordBrowser
//
//  Created by Greg Tropino on 10/2/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableDictionary *wordDictionary;
    NSMutableArray *words;
}

@end

@implementation ViewController

@synthesize tableView;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    wordDictionary = [NSMutableDictionary new];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    words = [NSMutableArray new];
    
    WordClass *map = [[WordClass alloc] initWithName:@"Map" addDefinition:@"A big ass drawing of surrounding landscape or landmarks" addSynonym:@"Cartography" addSecondSynonym:@"Geographical drawing"];
    [words addObject:map];
    [wordDictionary setObject:map forKey:@"Map"];
    
    WordClass *cookie = [[WordClass alloc] initWithName:@"cookie" addDefinition:@"A dessert typically enjoyed after a meal" addSynonym:@"treat" addSecondSynonym:@"dessert"];
    [words addObject:cookie];
    [wordDictionary setObject:cookie forKey:@"Cookie"];

    WordClass *chair = [[WordClass alloc] initWithName:@"chair" addDefinition:@"Something to rest upon in an upright position" addSynonym:@"seat" addSecondSynonym:@"stool"];
    [words addObject:chair];
    [wordDictionary setObject:chair forKey:@"Chair"];

    WordClass *table = [[WordClass alloc] initWithName:@"table" addDefinition:@"An item of which you would rest other things on" addSynonym:@"Dining Table" addSecondSynonym:@"Restaurant"];
    [words addObject:table];
    [wordDictionary setObject:table forKey:@"Table"];

    WordClass *trash = [[WordClass alloc] initWithName:@"trash" addDefinition:@"Something that has no value to the holder" addSynonym:@"garbage" addSecondSynonym:@"litter"];
    [words addObject:trash];
    [wordDictionary setObject:trash forKey:@"Trash"];

    WordClass *door = [[WordClass alloc] initWithName:@"door" addDefinition:@"A device that grants entry to another area" addSynonym:@"entrance" addSecondSynonym:@"exit"];
    [words addObject:door];
    [wordDictionary setObject:door forKey:@"Door"];

    WordClass *pig = [[WordClass alloc] initWithName:@"pig" addDefinition:@"An animal that is known for being messy" addSynonym:@"hog" addSecondSynonym:@"wild pig"];
    [words addObject:pig];
    [wordDictionary setObject:pig forKey:@"Pig"];

    WordClass *watch = [[WordClass alloc] initWithName:@"watch" addDefinition:@"A device that tells time" addSynonym:@"time piece" addSecondSynonym:@"clock"];
    [words addObject:watch];
    [wordDictionary setObject:watch forKey:@"Watch"];

    WordClass *witch = [[WordClass alloc] initWithName:@"witch" addDefinition:@"An evil woman that uses spells to cause mischief" addSynonym:@"hag" addSecondSynonym:@"a word that rhymes with witch"];
    [words addObject:witch];
    [wordDictionary setObject:witch forKey:@"Witch"];


//    WordClass *newWord = [[WordClass alloc] initWithName:<#(NSString *)#> addDefinition:<#(NSString *)#> addSynonym:<#(NSString *)#> addSecondSynonym:<#(NSString *)#>];
//    [words addObject:cookie];
//    [wordDictionary setObject:cookie forKey:@"Cookie"];

    
    [words enumerateObjectsUsingBlock:^(WordClass *allWords, NSUInteger idx, BOOL *stop) {
        [allWords.synonym addObject:allWords.synonym1];
        [allWords.synonym addObject:allWords.synonym2];
    }];
    
    [wordDictionary enumerateKeysAndObjectsUsingBlock:^(id key, WordClass *allWords, BOOL *stop) {
       // NSLog(@"%@", key);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [wordDictionary count];
}


-(UITableViewCell *)tableView:(UITableView *)z cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ABC"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", wordDictionary.allKeys[indexPath.row]];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    NSString *key = [NSString stringWithFormat:@"%@", wordDictionary.allKeys[indexPath.row]];
    
    WordClass *word = [wordDictionary objectForKey:key];
    
    SecondViewController *svc = segue.destinationViewController;
    [svc view];

    svc.labelForWord.text = [NSString stringWithFormat:@"%@", word.name];
    svc.labelForDefinition.text = [NSString stringWithFormat:@"%@", word.definition];
    svc.labelForSynonym1.text = [NSString stringWithFormat:@"%@", word.synonym1];
    svc.labelForSynonym2.text = [NSString stringWithFormat:@"%@", word.synonym2];
}

@end
