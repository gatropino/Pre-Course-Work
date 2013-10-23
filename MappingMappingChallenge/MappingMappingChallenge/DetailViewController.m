//
//  DetailViewController.m
//  MappingMappingChallenge
//
//  Created by Greg Tropino on 10/8/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize annotation, interModalLabel, routesLabel, stopNameLabel, directionOfTravelLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    routesLabel.text = annotation.routes;
    stopNameLabel.text = annotation.title;
    interModalLabel.text = annotation.inter_modal;
    directionOfTravelLabel.text = annotation.direction;

}
@end
