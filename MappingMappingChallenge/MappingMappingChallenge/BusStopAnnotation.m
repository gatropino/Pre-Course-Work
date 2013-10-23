//
//  BusStopPinView.m
//  MappingMappingChallenge
//
//  Created by Greg Tropino on 10/8/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "BusStopAnnotation.h"

@implementation BusStopAnnotation

- (BusStopAnnotation *) createStopName:(NSString *)title
                             routes:(NSString *)routes
                             stopID:(NSString *)stop_ID
                          direction:(NSString *)direction
                         interModal:(NSString *)inter_modal
                       atCoodinates:(CLLocationCoordinate2D)coord
{
    BusStopAnnotation *tempStopPin = [[BusStopAnnotation alloc] init];
    tempStopPin.title = title;
    tempStopPin.subtitle = routes;
    tempStopPin.coordinate = coord;
    tempStopPin.stop_ID = stop_ID;
    tempStopPin.routes = routes;
    tempStopPin.direction = direction;
    tempStopPin.inter_modal = inter_modal;
    
    return tempStopPin;
}

@end
