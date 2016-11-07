#include<stdio.h>
#include<ctype.h>
#include<string.h>
#include<stdlib.h>

int add(int first, int sec)
{first = first + sec;return first;}

int dothething(int dainput)
{ 
    int added = 0;
    if (dainput == 0)
        return 0;
    else if (dainput == 1)
        return 1;
    else
        {
            added = add(dothething(dainput - 1), dothething(dainput - 2));
            return added;
        }
}
int main(int argc, char **argv)
{
    char *input;
    input = argv[1];
    int inputval = atoi(input);
    int output = dothething(inputval);
    printf("Value:   %d\n", output);
    // this program runs fibonacci series using recursion
    // this version of fibonacci is slow and the code isn't optimized
    // the program craps out after 46th fib. > 2 billion

    return 0;
}
