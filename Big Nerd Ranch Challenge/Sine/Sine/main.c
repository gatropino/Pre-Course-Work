//
//  main.c
//  Sine
//
//  Created by Greg Tropino on 9/4/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#include <stdio.h>
#include <math.h>

int main(int argc, const char * argv[])
{
    // displays the amount of sine per radian
    float radians = 1;
    printf("If you have %f radians then you have %.3f sine", radians, sin(radians));
    
    return 0;
}

