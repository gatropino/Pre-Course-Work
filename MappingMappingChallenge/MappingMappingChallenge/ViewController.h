//
//  ViewController.h
//  MappingMappingChallenge
//
//  Created by Greg Tropino on 10/8/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BusStopAnnotation.h"

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *changePinsButton;

- (IBAction)pressedChangePinsButton:(id)sender;

@end
