package main

import (
	"github.com/stillwater-sc/go-openkl"
)

func main() {
	// initialize the runtime and its resource manager (RM)
	rsrcMngr := openkl.initialize();

	// create data structures through the RM
	openkl.dense_double A(5,3), B(3,5), C(5,5), D(5,5);
	rsrcMngr.new(A);
	rsrcMngr.new(B);
	rsrcMngr.new(C);
	rsrcMngr.new(D);

	err := openkl.gemm(A, B, C, D);
	if err != nil {
		// pull results into CPU space
		double cpuD[5][5];
		rsrcMngr.acquire(D, &cpuD);
	}

	// clean-up resources
	rsrcMngr.free(A);
	rsrcMngr.free(B);
	rsrcMngr.free(C);
	rsrcMngr.free(D);
}