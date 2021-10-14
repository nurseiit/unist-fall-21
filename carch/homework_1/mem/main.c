#include <stdio.h>
#include <stdlib.h>

extern int copy(int* a, int* b, int len);
char* pass = "pass";
char* fail = "fail";
int main(int argc, char* argv[]) {
    FILE *pFile = NULL;
    pFile = fopen("test.txt", "r");
    if (pFile == NULL) {
        printf("Failed to open test input file\n");
        exit(1);
    }
    int i = 1;
    while ( !feof(pFile)) {
        int len;
        char* rstr;
        int r = fscanf(pFile, "%d", &len);
        if (r != 1) {
            break;
        }
        int *src, *dest;
        src = (int*)malloc(sizeof(int)*len);
        dest = (int*)malloc(sizeof(int)*len);
        for (int j = 0; j < len; j += 1) {
            r = fscanf(pFile, "%d", src+j);
            if (r != 1) {
                break;
                exit(1);
            }
        }
        copy(dest, src, len);
        
        rstr = pass;
        for(int j = 0; j < len; j += 1) {
            if(dest[j] != src[j]) {
                rstr = fail;
                break;
            }
        }
        
        printf("test [%d]: [%s]\n", i, rstr);
        printf("src: ");
        for(int j = 0; j < len; j += 1) {
            printf("%d ", src[j]);
        }
        printf("\n");
        printf("dest: ");
        for(int j = 0; j < len; j += 1) {
            printf("%d ", dest[j]);
        }
        printf("\n");
        free(src);
        free(dest);
        src = NULL;
        dest = NULL;
        i += 1;
    }
    return 0;
}
