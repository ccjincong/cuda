#include<stdio.h>

__global__ void VecAdd(float* A, float* B, float* C)
{
	    int i = threadIdx.x;
	        C[i] = A[i] + B[i];
}

int main()
{
	const int N = 32; //长度
	float A[N],B[N],C[N];

	for(int i=0;i<N;i++)
	{
		A[i]=i;
		B[i]=i;
	}

	// Allocate memory on the device
	float *dev_A, *dev_B, *dev_C;
	cudaMalloc(&dev_A, N * sizeof(float));
	cudaMalloc(&dev_B, N * sizeof(float));
	cudaMalloc(&dev_C, N * sizeof(float));

	// Copy input vectors to device
	cudaMemcpy(dev_A, A, N * sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(dev_B, B, N * sizeof(float), cudaMemcpyHostToDevice);
	// Launch kernel with N threads
	VecAdd<<<1, N>>>(dev_A, dev_B, dev_C);

	// Copy output vector from device
	cudaMemcpy(C, dev_C, N * sizeof(float), cudaMemcpyDeviceToHost);

	// Free memory on the device
	cudaFree(dev_A);
	cudaFree(dev_B);
	cudaFree(dev_C);

	// Print output vector
	for (int i = 0; i < N; i++)
	{
		printf("%f ", C[i]);
	}
	printf("\n");

	return 0;
}




