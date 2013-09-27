//
//  EditViewController.h
//  NSArray
//
//  Created by Greg Tropino on 9/25/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditViewControllerDelegate

-(void)editViewController: (id)evc didEdit: (NSString *)text index: (int) index;
@end
@interface EditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) id <EditViewControllerDelegate> delegate;
@property int index;
@property (weak, nonatomic) NSString *passedText;

- (IBAction)endEditingWithButton:(id)sender;

@end
