//
//  main.c
//  Degrees
//
//  Created by Greg Tropino on 9/4/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

// Declare a global variable
static float lastTemperature = 50.0;

float fahrenheitFromCelsius(float cel)
{
    lastTemperature = cel;
    float fahr = cel * 1.8 + 32.0;
    printf("%f celsius is %f fahrenheit\n", cel, fahr);
    return fahr;
}


int main(int argc, const char * argv[])
{

    float freezeInC = 0;
    float freezeInF = fahrenheitFromCelsius(freezeInC);
    printf("water freezes at %f degrees Fahrenheit\n", freezeInF);
    printf("The last temperature converted was %f\n", lastTemperature);
    return EXIT_SUCCESS;
}

