#define _CRT_CECURE_NO_WARNINGS
#include <stdio.h>

int arr[100];

int part_2() {
    int arr_size;
    printf("Input array size: ");
    scanf_s("%d", &arr_size);
    printf("Input array elements: ");
    int count = 0;

elements_loop:
    if (count >= arr_size) goto elements_end;
    scanf_s("%d", &arr[count]);
    count++;
    goto elements_loop;
elements_end:

    int i = 0;
    int j = 0;
    int temp;
    int temp_1;

bbsort_start:

    if (i >= arr_size - 1) goto bbsort_end;
    j = 0;

iter_bbsort_start:

    if (j >= arr_size - i - 1) goto iter_bbsort_end;
    if (arr[j] <= arr[j + 1]) goto comp_end;
    temp = arr[j];
    temp_1 = arr[j + 1];
    arr[j] = temp_1;
    arr[j + 1] = temp;
comp_end:
    j++;
    goto iter_bbsort_start;

iter_bbsort_end:

    i++;
    goto bbsort_start;

bbsort_end:

    printf("Sorted: ");
    i = 0;

output_start:
    if (i >= arr_size)
        goto output_end;
    printf("%d ", arr[i]);
    i++;
    goto output_start;

output_end:

    return 0;
}


int main() {
    part_2();
}