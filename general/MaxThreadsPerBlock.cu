#include <iostream>
int main()
{
	int maxThreadsPerBlock;
	cudaDeviceGetAttribute(&maxThreadsPerBlock, cudaDevAttrMaxThreadsPerBlock, 0);
	std::cout<<"maxThreadPerBlock: "<<maxThreadsPerBlock<<std::endl;
}
