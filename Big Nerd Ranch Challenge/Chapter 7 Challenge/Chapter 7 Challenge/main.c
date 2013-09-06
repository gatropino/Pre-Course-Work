//
//  main.c
//  Chapter 7 Challenge
//
//  Created by Greg Tropino on 9/4/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int x = 99;
    while (x != 0) {
        printf("%d\n", x);
        x = x - 3;
        if (x % 5 == 0) {
        printf("Found one!\n");
            }
    }
    printf("%d\n", x);
    return 0;
}

