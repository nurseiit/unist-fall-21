#include <stdio.h>
#include <stdlib.h>

extern int gcd(int a, int b);
extern int lcm(int a, int b);
char* pass = "pass";
char* fail = "fail";
int main(int argc, char* argv[]) {
    FILE *pFile = NULL;
    pFile = fopen("test.txt", "r");
    if (pFile == NULL) {
        printf("Failed to open test input file\n");
        fflush(stdout);
        exit(1);
    }
    int i = 1;
    while ( !feof(pFile)) {
        int a, b, refg, refl, resg, resl;
        char *gstr, *lstr;
        fscanf(pFile, "%d %d %d %d\n",&a, &b, &refg, &refl);
        resg = gcd(a, b);
        resl = lcm(a, b);
        if (resg == refg)   gstr = pass;
        else                gstr = fail;
        if (resl == refl)   lstr = pass;
        else                lstr = fail;
        
        printf("test [%d]: [%s]: gcd(%d, %d) = %d? (computed: %d)\n",i, gstr, a, b, refg, resg);
        printf("test [%d]: [%s]: lcm(%d, %d) = %d? (computed: %d)\n",i, lstr, a, b, refl, resl);
        i += 1;
    }
    return 0;
}
