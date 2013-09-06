//
//  main.c
//  TwoFloats
//
//  Created by Greg Tropino on 9/3/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
//declare two variables of type float and assign each with a decimal point, declare another variable of type double and have it equal the sum of the two floats, then print the result
    float a = 12.3;
    float b = 2.4;
    double c = a + b;
    
    printf("If you add A and B you will get %f.\n", c);
    
    return 0;
}

