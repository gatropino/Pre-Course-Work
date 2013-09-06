//
//  main.c
//  Triangle
//
//  Created by Greg Tropino on 9/4/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#include <stdio.h>

float remainingAngle(x , y)
{
    float a = 180 - (x + y);
    return a;
}


int main(int argc, const char * argv[])
{
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    printf("The third angle is %.2f\n", angleC);
    return 0;
}

