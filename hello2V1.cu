/*
 ============================================================================
 Author        : G. Barlas
 Version       : 1.0
 Last modified : December 2014
 License       : Released under the GNU GPL 3.0
 Description   :
 To build use  : nvcc hello2.cu -o hello2 -arch=sm_20
 ============================================================================
 */
#include <stdio.h>
#include <cuda.h>

__global__ void hello ()
{
  int myID = ( blockIdx.z * gridDim.x * gridDim.y  +
                blockIdx.y * gridDim.x +
               blockIdx.x ) * blockDim.x * blockDim.y * blockDim.z +
                threadIdx.z *  blockDim.x * blockDim.y +
                threadIdx.y * blockDim.x +
                threadIdx.x;

  printf ("Hello Linda Jimenez, 21169 from thread %i\n", myID);

  if (myID == 4096){
    printf("Last message: Hello Linda Jimenez, 21169 from thread %i\n", myID);
  }
}

int main ()
{
  dim3 g(4, 2);    
  dim3 b(32, 16); 
  hello<<<g, b>>>();
  cudaDeviceSynchronize();  //use instead, ^ is deprecated
  return 0;
}
