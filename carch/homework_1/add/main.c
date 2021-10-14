#include <stdio.h>
#include <stdlib.h>

extern int add(int a, int b);
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
        int a, b, ref, res;
        char *rstr;
        fscanf(pFile, "%d %d %d\n",&a, &b, &ref);
        res = add(a, b);
        if (res == ref)     rstr = pass;
        else                rstr = fail;
        
        printf("test [%d]: [%s]: add(%d, %d) = %d? (computed: %d)\n",i, rstr, a, b, ref, res);
        i += 1;
    }
    return 0;
}
