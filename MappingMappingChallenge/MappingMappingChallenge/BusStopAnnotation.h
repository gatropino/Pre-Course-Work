//
//  BusStopPinView.h
//  MappingMappingChallenge
//
//  Created by Greg Tropino on 10/8/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface BusStopAnnotation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (weak, nonatomic) NSString *stop_ID;
@property (weak, nonatomic) NSString *routes;
@property (weak, nonatomic) NSString *direction;
@property (weak, nonatomic) NSString *inter_modal;
@property (nonatomic, copy) NSString *subtitle;


- (BusStopAnnotation *) createStopName:(NSString *)title
                             routes:(NSString *)routes
                             stopID:(NSString *)stop_ID
                          direction:(NSString *)direction
                         interModal:(NSString *)inter_modal
                       atCoodinates:(CLLocationCoordinate2D)coord;

@end
