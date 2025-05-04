#include <stdio.h>
#include <time.h>

extern void tsta();

int main() {
        clock_t tic;
        clock_t toc;
        double  duration;

        tic = clock();
        for (int i = 0; i < 10; ++i) {
                tsta();
        }
        toc = clock();

        duration = (double)(toc - tic) / CLOCKS_PER_SEC;
        printf("Time taken: %fs\n", duration);
        
        return 0;
}
