//
//  main.c
//  Coolness
//
//  Created by Greg Tropino on 9/4/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int i;
    for (i = 0; i < 12; i++) {
        if (i % 3 == 0) {
            continue;
        }
        printf("Checking i = %d\n", i);
        if (i + 90 == i * i) {
            break;
        }
    }
    printf("The answer is %d.\n", i);
    return 0;
}

