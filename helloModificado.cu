/*
 ============================================================================
 Author        : G. Barlas
 Version       : 1.0
 Last modified : December 2014
 License       : Released under the GNU GPL 3.0
 Description   :
 To build use  : nvcc hello.cu -o hello -arch=sm_20
 ============================================================================
 */
#include <stdio.h>
#include <cuda.h>

__global__ void hello()
{
    int threadId = threadIdx.x + blockIdx.x * blockDim.x;
    printf("Linda Jimenez, 21169 from thread %i\n", threadId);

    if (threadId == 1023) {
        printf("Last Message: Linda Jimenez, 21169 from thread %i \n", threadId);
    }
}

int main()
{
    hello<<<1, 2048>>>();
    cudaThreadSynchronize(); //deprecated
    return 0;
}
