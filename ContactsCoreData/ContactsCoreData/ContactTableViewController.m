//
//  ContactTableViewController.m
//  ContactsCoreData
//
//  Created by Greg Tropino on 10/16/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ContactTableViewController.h"
#import "Person.h"
#import "SeeDetailViewController.h"

@interface ContactTableViewController ()
{
    IBOutlet UITableView* myTableView;
}
@end

@interface NSManagedObject (FirstLetter)
- (NSString *)uppercaseFirstLetterOfName;
@end

@implementation NSManagedObject (FirstLetter)
- (NSString *)uppercaseFirstLetterOfName {
    
    [self willAccessValueForKey:@"uppercaseFirstLetterOfName"];
    NSString *aString = [[self valueForKey:@"firstName"]uppercaseString];
    NSString *stringToReturn = [aString substringWithRange:[aString rangeOfComposedCharacterSequenceAtIndex:0]];
    [self didAccessValueForKey:@"uppercaseFirstLetterOfName"];
    return stringToReturn;
}
@end

@implementation ContactTableViewController
{
    id observer1, observer2;
    NSMutableArray *searchArray;
    NSMutableArray *filteredSearchArray;
}

@synthesize fetchedResultsController, managedObjectContext, searchBar;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Holy Error Batman! %@", error);
    }
    searchBar.delegate = self;
    //searchBar.scopeButtonTitles = @[@"First Name", @"Email"];
    filteredSearchArray = [NSMutableArray new];
    searchArray = [NSArray new];
}

-(void) notificationHandler
{
    NSManagedObjectContext *moc = managedObjectContext;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    observer1 = [nc addObserverForName:@"pressedSave" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note)
                 {
                     NSError *error = nil;
                     if (![moc save:&error])
                     {
                         NSLog(@"Too many errors, I need more power!! %@", error);
                     }
                 }];
    
    observer2 = [nc addObserverForName:@"pressedCancel" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note)
                 {
                     [moc deleteObject:note.object];
                 }];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer1];
    [[NSNotificationCenter defaultCenter] removeObserver:observer2];
}


-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}


-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
        {
            Person *changedPerson = [self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = changedPerson.firstName;
        }
            break;
            
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

-(NSFetchedResultsController *) fetchedResultsController
{
    if (fetchedResultsController != nil)
    {
        return fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person"
                                              inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName"
                                                                   ascending:YES
                                                                    selector:@selector(caseInsensitiveCompare:)];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:@"uppercaseFirstLetterOfName" cacheName:@"Temp"];
    fetchedResultsController.delegate = self;
    
    return fetchedResultsController;
}

#pragma mark - tableview

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSManagedObjectContext *context = managedObjectContext;
        Person *personToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [context deleteObject:personToDelete];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Error! %@", error);
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> secInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [secInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    Person *person; // = [self.fetchedResultsController objectAtIndexPath:indexPath];
    Person *person2;
    filteredSearchArray = [[fetchedResultsController fetchedObjects] mutableCopy];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
       person2 = [filteredSearchArray objectAtIndex:indexPath.row];
        //cell.textLabel.text = person2.firstName;
    } else {
        person = [fetchedResultsController.fetchedObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = person.firstName;
    }
    
    return cell;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[[self.fetchedResultsController sections] objectAtIndex:section] name];
    
    //  id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
    //return [sectionInfo name];
}

#pragma mark - UISearchDisplayController Delegate Methods

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [filteredSearchArray removeAllObjects];
    // Filter the array using NSPredicate
    NSLog(@"%@", searchText);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.firstName contains[c] %@",searchText];
    filteredSearchArray = [NSMutableArray arrayWithArray:[fetchedResultsController.fetchedObjects filteredArrayUsingPredicate:predicate]];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"addContact"]) {
        AddContactViewController *acvc = (AddContactViewController *)[segue destinationViewController];
        Person *newPerson = (Person *) [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[self managedObjectContext]];
        newPerson.address = (Address *) [NSEntityDescription insertNewObjectForEntityForName:@"Address" inManagedObjectContext:[self managedObjectContext]];
        acvc.currentPerson = newPerson;
    }
    
    if ([[segue identifier] isEqualToString:@"viewContact"])
    {
        SeeDetailViewController *sdvc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Person *selectedPerson = [self.fetchedResultsController objectAtIndexPath:indexPath];
        sdvc.currentPerson = selectedPerson;
    }
}

@end
