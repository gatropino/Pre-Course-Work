//
//  ViewController.m
//  MappingMappingChallenge
//
//  Created by Greg Tropino on 10/8/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "MetraAnnotationView.h"
#import "PaceAnnotationView.h"
#import "DefaultPinView.h"

@interface ViewController ()
{
    NSMutableDictionary *firstDictPass;
    NSArray *firstArrayPass;
    NSString *stopName, *latitude, *longitude, *stopId, *routes, *interModal, *direction;
}
@end

@implementation ViewController

@synthesize changePinsButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://mobilemakers.co/lib/bus.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         firstDictPass = [NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
         
         firstArrayPass = [firstDictPass objectForKey:@"row"];
         
         for (int i = 0; i < [firstArrayPass count]; i++) {
             
             stopId = [[firstArrayPass objectAtIndex:i] objectForKey:@"stop_id"];
             stopName = [[firstArrayPass objectAtIndex:i] objectForKey:@"cta_stop_name"];
             latitude = [[firstArrayPass objectAtIndex:i] objectForKey:@"latitude"];
             longitude = [[firstArrayPass objectAtIndex:i] objectForKey:@"longitude"];
             routes = [[firstArrayPass objectAtIndex:i] objectForKey:@"routes"];
             interModal = [[firstArrayPass objectAtIndex:i] objectForKey:@"inter_modal"];
             direction = [[firstArrayPass objectAtIndex:i] objectForKey:@"direction"];
             
             if (!interModal)
             {
                 interModal = @"Not Present";
             }
             
             double convertedLatitude = latitude.doubleValue;
             double convertedLongitude = longitude.doubleValue;
             CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(convertedLatitude, convertedLongitude);
             
             BusStopAnnotation *bspv = [[BusStopAnnotation alloc] init];
             
             bspv = [bspv createStopName:stopName routes:routes stopID:stopId direction:direction interModal:interModal atCoodinates:coord];
             
             MKCoordinateSpan span = MKCoordinateSpanMake(.01, .01);
             
             [self.mapView setRegion:MKCoordinateRegionMake(coord, span)  animated:YES];
             [self.mapView addAnnotation:bspv];
         }
     }];
}



-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(BusStopAnnotation *)annotation
{
    NSString *reuseID = @"abc";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseID];
    if (!view)
    {
        if ([annotation.inter_modal isEqualToString:@"Sunny"])
        {
            view = [[MetraAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseID];
            view.canShowCallout = YES;
            view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            NSLog(@"Sunny Galore!!!");
            return view;
        }
         if ([annotation.inter_modal isEqualToString:@"Metra"])
         {
             view = [[MetraAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseID];
             view.canShowCallout = YES;
             view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
             
             return view;
         }
        if ([annotation.inter_modal isEqualToString:@"Pace"])
        {
            view = [[PaceAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseID];
            view.canShowCallout = YES;
            view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
            return view;
        }

        view = [[DefaultPinView alloc] initWithAnnotation:annotation reuseIdentifier:reuseID];      //for standard pin
        //view = [[MobileMakersAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseID];  // for custom pin
        view.canShowCallout = YES;
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    else
    {
        view.annotation = annotation;
    }

    if ([annotation.inter_modal isEqualToString:@"Sunny"])
    {
        view = [[MetraAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseID];
        view.canShowCallout = YES;
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        NSLog(@"Sunny Galore!!!");
        return view;
    }

    
    CLLocationCoordinate2D  points[4];
    
    points[0] = CLLocationCoordinate2DMake(41.885727, -87.633924);
    points[1] = CLLocationCoordinate2DMake(41.885681, -87.626288);
    points[2] = CLLocationCoordinate2DMake(41.876975, -87.626603);
    points[3] = CLLocationCoordinate2DMake(41.876863, -87.633712);
    
    MKPolygon* poly = [MKPolygon polygonWithCoordinates:points count:4];
    poly.title = @"ChicagoLoop";
    
    [mapView addOverlay:poly];


    return view;
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolygon class]])
    {
        MKPolygonView* aView = [[MKPolygonView alloc] initWithPolygon:(MKPolygon*)overlay];
        
        aView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.025];
        aView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.025];
        aView.lineWidth = 1;
        
        return aView;
    }
    
    return nil;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"]; //asking for storyboardID
    
    dvc.annotation = view.annotation;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

- (IBAction)pressedChangePinsButton:(id)sender
{
    NSString *image;
    if (changePinsButton.tag == 0)
    {
        image = @"sunny.jpeg";
        changePinsButton.tag++;
    } else if (changePinsButton.tag == 1)
    {
        image = @"rainy.gif";
        changePinsButton.tag++;
    } else if (changePinsButton.tag == 2)
    {
        image = @"windy.jpg";
        changePinsButton.tag++;
    } else if (changePinsButton.tag == 3)
    {
        image = @"cloudy.jpg";
        changePinsButton.tag++;
        changePinsButton.tag = 0;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangePins" object:image];
}
@end
