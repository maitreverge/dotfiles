#include <stdio.h>
#include <string.h>

void displayTestSeparator(const char *text, int colorCode) {
    int separatorLength = 38;  // Total length of the separator line
    int textLength = strlen(text);
    int paddingLength = separatorLength - textLength;
    int leftPadding = paddingLength / 2;
    int rightPadding = paddingLength - leftPadding;

    printf("\033[%dm\n", colorCode);  // Set the desired text color
    printf("  ///////////////////////////////////////////\n");
    printf(" //%*s%s%*s //\n", leftPadding, "", text, rightPadding, "");
    printf("///////////////////////////////////////////\n");
    printf("\033[0m\n");  // Reset text color
}

displayTestSeparator("TEST", 33);

displayTestSeparator("test test test", 32);

displayTestSeparator("mega test", 35);

/*

This custom function displays

  ///////////////////////////////////////////
 //               TEST  %s                //
///////////////////////////////////////////

and keep the same global shape whatever the lengh of the text (must be < 40 characters)

Some color codes :

Color	Regular	 Dark	 Bright
Black	30		30;2		90
Red		31		31;2		91
Green	32		32;2		92
Yellow	33		33;2		93
Blue	34		34;2		94
Magenta	35		35;2		95
Cyan	36		36;2		96
White	37		37;2		97

*/
