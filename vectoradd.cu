__global__ void vectoradd
(
	int size,
	const float* vecA,
	const float* vecB,
	      float* vecC
)
{
	int idx = threadIdx.x + blockDim.x*blockIdx.x;
	if (idx >= size)
		return;
	
	vecC[idx] = 0;
	for (int i = 0; i < 100000; i++)
		atomicAdd(&vecC[idx], vecA[idx] + vecB[idx]);
}

void vectoradd
(
	cudaStream_t stream, 
	int grid_size,
	int block_size,
	int problem_size,
	const float* vecA,
	const float* vecB,
	float* vecC
)
{
	vectoradd<<<grid_size / block_size, block_size, 0, stream>>>(problem_size, vecA, vecB, vecC);
}
