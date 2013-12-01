//
//  ViewController.m
//  MapIt
//
//  Created by Greg Tropino on 10/7/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLLocationManager *locationManager;
    MKMapView *mapView;
    NSMutableDictionary *firstDictPass, *secondDictPass, *thirdDictPass;
    NSMutableArray *firstArrayPass;
    NSString *newLatitude, *newLongitude, *completeUrl;
}

@end

@implementation ViewController

@synthesize addressTextField, locateButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    
    mapView = [[MKMapView alloc]
               initWithFrame:CGRectMake(0,
                                        0,
                                        self.view.bounds.size.width,
                                        self.view.bounds.size.height)
               ];
    mapView.showsUserLocation = YES;
    mapView.mapType = MKMapTypeHybrid;
    mapView.delegate = self;
    [self.view insertSubview:mapView belowSubview:addressTextField];
    [self.view insertSubview:mapView belowSubview:locateButton];

}

-(void)pullLatLong
{
NSURL *url = [NSURL URLWithString:completeUrl];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
[NSURLConnection sendAsynchronousRequest:request
                                   queue:[NSOperationQueue mainQueue]
                       completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
 {
     firstDictPass = [NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
     
     firstArrayPass = [firstDictPass objectForKey:@"results"];
     
     newLatitude = [[[[firstArrayPass objectAtIndex:0] objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lat"];
     newLongitude = [[[[firstArrayPass objectAtIndex:0] objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"];

 }];
}

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    if (!addressTextField.text.intValue)
    {
        location.latitude = 41.893740;
        location.longitude = -87.635330;
    } else
    {
        location.latitude = newLatitude.doubleValue;
        location.longitude = newLongitude.doubleValue;
    }
    region.span = span;
    region.center = location;
    [aMapView setRegion:region animated:YES];
}



- (IBAction)pressedLocateButton:(id)sender
{
    
    NSString *searchString = addressTextField.text;
    
    NSString *convertedString =
    [[searchString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]
     componentsJoinedByString:@"+"];
    
    NSString *urlPart1 = @"http://maps.googleapis.com/maps/api/geocode/json?address=";
    NSString *urlPart2 = convertedString;
    NSString *urlPart3 = @"&sensor=false";
    NSString *partialUrl = [urlPart1 stringByAppendingString:urlPart2];
    completeUrl = [partialUrl stringByAppendingString:urlPart3];
    NSLog(@"%@", completeUrl);
    
    CLLocationCoordinate2D location;
    [self performSelector:@selector(pullLatLong)];
    location.latitude = newLatitude.doubleValue;
    location.longitude = newLongitude.doubleValue;
    [mapView setCenterCoordinate:location animated:YES];
    [self.view endEditing:YES];

}
@end
