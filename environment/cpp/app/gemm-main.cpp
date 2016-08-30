#include <openkl.hpp>

int main (int argc, char* argv[]) {
    // initialize the runtime and its resource manager (RM)
    rsrcMngr = openkl::initialize();

    // create data structures through the RM
    dense_matrix<double> A(5,3), B(3,5), C(5,5), D(5,5);
    rsrcMngr.new(A);
    rsrcMngr.new(B);
    rsrcMngr.new(C);
    rsrcMngr.new(D);

    int errNo = openkl::gemm(A, B, C, D);
    if (errNo == 0) {
        // pull results into CPU space
        double cpuD[5][5];
        rsrcMngr.acquire(D, &cpuD);
    }

    // clean-up resources
    rsrcMngr.free(A);
    rsrcMngr.free(B);
    rsrcMngr.free(C);
    rsrcMngr.free(D);

    return 0;
}