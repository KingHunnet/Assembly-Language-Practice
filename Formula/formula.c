#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
#include<time.h>
#include<sys/time.h>
#include"nCr.h"

int main(int argc, char **argv)
{
    struct timeval start, end;
    gettimeofday(&start, NULL);
    if (argc != 2)
        fprintf(stderr, "not the right amount of arguments");

    char *in;
    in = argv[1];
    char h[2] = "-h";
    char *dashH = &h[0];
    if (strcmp(in, dashH) == 0)
        {printf("Usage: formula <positive integer>\nIntegers over 13 will force an overflow in the Factorial function and output will not be correct. Read the readme.pdf for more information.\n");
        return 0;
    }
    int input = atoi(in); 
    printf("(1+x)^%d = 1", input);
    int counter = 1;
    while (counter <= input)
    {
        int ncx = nCr(input, counter);
        printf(" + %d*x^%d", ncx, counter);
        counter++;
    }
    //first     factorial
    //second    nCr
    //lastly    formula
    //main = formula
    printf("\n");
    gettimeofday(&end, NULL);
    printf("Time required: %ld milliseconds\n", ((end.tv_sec*1000000 + end.tv_usec)-(start.tv_sec*1000000 + start.tv_usec)));
    return 0;
}
