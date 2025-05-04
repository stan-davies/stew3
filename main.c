#include <stdio.h>
#include <time.h>

extern void tsta();

int main() {
        clock_t tic;
        clock_t toc;
        double  duration;

        for (int r = 0; r < 3; ++r) {
                tic = clock();
                for (int e = 0; e < 5000000; ++e) {
                        tsta();
                }
                toc = clock();
                duration += (double)(toc - tic) / CLOCKS_PER_SEC;
        }

        duration /= 3;

        printf("Time taken: %fs\n", duration);
        
        return 0;
}
