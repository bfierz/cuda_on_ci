
#include <cuda_runtime.h>

void vectoradd
(
	cudaStream_t stream, 
	int grid_size,
	int block_size,
	int problem_size,
	const float* vecA,
	const float* vecB,
	float* vecC
);

int main(int argc, char* argv[])
{
	vectoradd(0, 10, 10, 100, nullptr, nullptr, nullptr);
	return 0;
}
