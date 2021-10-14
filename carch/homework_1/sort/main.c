#include <stdio.h>
#include <stdlib.h>

extern void sort(int* out, int* in, int num);
extern void insert(int* out, int num, int in);

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
    while( !feof(pFile)) {
        int len;
        int *in, *out;
        char* rstr;
        int r = fscanf(pFile, "%d", &len);
        if(r != 1) {
            break;
        }

        in = (int*)malloc(sizeof(int)*len);
        out = (int*)malloc(sizeof(int)*len);

        for (int j = 0; j < len; j+=1) {
            fscanf(pFile, "%d", in+j);
        }
        sort(out, in, len);

        rstr = pass;
        for(int j = 1; j < len; j += 1) {
            if(out[j-1] > out[j]) {
                rstr = fail;
                break;
            }
        }
        printf("test [%d]: [%s]\n", i, rstr);
        printf("in: ");
        for(int j = 0; j < len; j += 1) {
            printf("%d ", in[j]);
        }
        printf("\n");
        printf("out: ");
        for(int j = 0; j < len; j += 1) {
            printf("%d ", out[j]);
        }
        printf("\n");
        free(in);
        free(out);
        in = NULL;
        out = NULL;
        i += 1;
    }
    return 0;
}
