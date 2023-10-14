#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 30000
#define RAND_MAX 100

void matrix_x_vector(int *matrix, int *vector, int *result) {
    int i, j;
    for (j = 0; j < N; j++) {
        for (i = 0; i < N; i++) {
            result[i] += matrix[i*N+j] * vector[j];
        }
    }
}

int main() {
    srand(time(NULL));

    // Alocando memoria para os arrays
    int *matrix = calloc(N*N, sizeof(int));
    int *vector = malloc(N * sizeof(int));
    int *result = malloc(N * sizeof(int));

    // Gerando os numeros que populam os arrays
    int i, j;
    for (i = 0; i < N; i++) {
        vector[i] = rand() % (RAND_MAX + 1); // Gerando numeros entre 0 e 100
        for (j = 0; j < N; j++) {
            matrix[i*N+j] = rand() % (RAND_MAX + 1); // Gerando numeros entre 0 e 100
        }
    }

    // Contando o tempo da operacao
    clock_t start_time = clock();
    matrix_x_vector(matrix, vector, result);
    clock_t end_time = clock();

    // printf("Result of matrix x vector multiplication:\n");
    // for (i = 0; i < N; i++) {
    //     printf("%d ", result[i]);
    // }
    // printf("\n");

    double elapsed_time = (double) (end_time - start_time) / CLOCKS_PER_SEC;
    printf("Time taken for multiplication in C: %.5f seconds\n", elapsed_time);

    // Liberando a memoria alocada
    free(matrix);
    free(vector);
    free(result);

    return 0;
}
