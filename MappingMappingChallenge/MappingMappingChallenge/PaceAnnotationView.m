//
//  PaceAnnotationView.m
//  MappingMappingChallenge
//
//  Created by Greg Tropino on 10/8/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#import "PaceAnnotationView.h"

@implementation PaceAnnotationView
{
    id observer;
}

-(id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(20, 20), NO, 0.0);
        [[UIImage imageNamed:@"paceimage.jpg"] drawInRect:CGRectMake(0, 0, 20, 20)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.image = newImage;
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        observer = [nc addObserverForName:@"ChangePins" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note)
                    {
                        NSLog(@"Sunny Galore!!!");
                        UIGraphicsBeginImageContextWithOptions(CGSizeMake(20, 20), NO, 0.0);
                        [[UIImage imageNamed:note.object] drawInRect:CGRectMake(0, 0, 20, 20)];
                        UIImage *newImage2 = UIGraphicsGetImageFromCurrentImageContext();
                        UIGraphicsEndImageContext();
                        self.image = newImage2;
                    }];

    }
    return self;
}
@end
