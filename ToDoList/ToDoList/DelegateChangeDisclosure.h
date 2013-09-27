//
//  DelegateChangeDisclosure.h
//  ToDoList
//
//  Created by Greg Tropino on 9/24/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DetailDisclosureViewControllerDelegate <NSObject>

- (void)detailDisclosureViewController:(id)viewController textEdited:(NSString *)cell;

@end
