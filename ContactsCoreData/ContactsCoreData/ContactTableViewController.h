//
//  ContactTableViewController.h
//  ContactsCoreData
//
//  Created by Greg Tropino on 10/16/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddContactViewController.h"
#import "Address.h"


@interface ContactTableViewController : UITableViewController <NSFetchedResultsControllerDelegate, UISearchDisplayDelegate, UISearchBarDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;



@end