#define _CRT_CECURE_NO_WARNINGS
#include <stdio.h>

int arr[100];

int part_1() {
    int arr_size;
    printf("Input array size: ");
    scanf_s("%d", &arr_size);
    printf("Input array elements: ");
    for (int i = 0; i < arr_size; i++) {
        scanf_s("%d", &arr[i]);
    }
    for (int i = 0; i < arr_size - 1; i++) {
        for (int j = 0; j < arr_size - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    printf("sorted: ");
    for (int i = 0; i < arr_size; i++) {
        printf("%d ", arr[i]);
    }
    return 0;
}

int main() {
    part_1();
}