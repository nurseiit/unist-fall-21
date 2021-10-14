#include <stdio.h>
#include <stdlib.h>

extern void matmul(int* out, int* a, int* b, int dim);
extern void matmul_idx(int* out, int* a, int* b, int dim, int x, int y);
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
        int dim;
        int r = fscanf(pFile, "%d", &dim);
        if(r != 1) {
            break;
        }
        
        int *a, *b, *ref, *res;
        char* rstr;
        a = (int*)malloc(sizeof(int)*dim*dim);
        b = (int*)malloc(sizeof(int)*dim*dim);
        ref = (int*)malloc(sizeof(int)*dim*dim);
        res = (int*)malloc(sizeof(int)*dim*dim);
        for (int j = 0; j < dim*dim; j+=1) {
            fscanf(pFile, "%d", a+j);
        }
        for (int j = 0; j < dim*dim; j+=1) {
            fscanf(pFile, "%d", b+j);
        }
        for (int j = 0; j < dim*dim; j+=1) {
            fscanf(pFile, "%d", ref+j);
        }
        matmul(res, a, b, dim);
        rstr = pass;
        for(int j = 0; j < dim*dim; j+=1) {
            if(res[j] != ref[j]) {
                rstr = fail;
                break;
            }
        }
        printf("test [%d]: [%s]\n",i,rstr);
        printf("a: ");
        for(int j = 0; j < dim * dim; j += 1) {
            printf("%d ", a[j]);
        }
        printf("\n");
        printf("b: ");
        for(int j = 0; j < dim * dim; j += 1) {
            printf("%d ", b[j]);
        }
        printf("\n");
        printf("res: ");
        for(int j = 0; j < dim * dim; j += 1) {
            printf("%d ", res[j]);
        }
        printf("\n");
        printf("ref: ");
        for(int j = 0; j < dim * dim; j += 1) {
            printf("%d ", ref[j]);
        }
        printf("\n");       
        i += 1;
        free(a);
        free(b);
        free(ref);
        free(res);
        a = NULL;
        b = NULL;
        ref = NULL;
        res = NULL;
    }
    return 0;
}
