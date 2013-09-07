//
//  main.c
//  Challenge 10
//
//  Created by Greg Tropino on 9/6/13.
//  Copyright (c) 2013 Greg Tropino. All rights reserved.
//

#include <stdio.h>
#include <time.h>


void futuretime (int seconds) {
    
    long secondsSince1970 = time(NULL);
    
    long combinedtime = secondsSince1970 + seconds;
    
    struct tm now;
    
    localtime_r(&combinedtime, &now);
    
    printf("If you added %d seconds to the current time, then the date would be %d-%d-%d\n", seconds, now.tm_mon+1, now.tm_mday, now.tm_year+1900);
}



int main(int argc, const char * argv[])
{
    int secondstoadd = 4000000; // how many seconds will be added to the current time
    futuretime(secondstoadd);
    return 0;
}