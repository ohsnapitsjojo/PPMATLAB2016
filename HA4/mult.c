#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, const mxArray *prhs[])
{
    double *first = mxGetPr(prhs[0]);
    double *second = mxGetPr(prhs[1]);
    double *out;
    double sum = 0;
    int size = mxGetN(prhs[1]), c=0, d=0, k=0;
    
    if(nrhs!=2) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs",
                      "Two inputs required.");
    }
    
    if(nlhs!=1) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nlhs",
                      "One output required.");
    }
    if( !mxIsDouble(prhs[0]) || mxIsComplex(prhs[0])) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notDouble",
            "Input matrix must be double.");
    }

    if( !mxIsDouble(prhs[1]) || mxIsComplex(prhs[1])) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notDouble",
            "Input matrix must be double.");
    }
    
    if(mxGetM(prhs[0]) != mxGetM(prhs[1])) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notRowVector",
                      "Input must be Matrices of the same size.");
    }
    
    if(mxGetN(prhs[0]) != mxGetN(prhs[1])) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notRowVector",
                      "Input must be Matrices of the same size.");
    }
    
    if(mxGetN(prhs[0]) != mxGetM(prhs[0])) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notRowVector",
                      "Input must be quadratic Matrices.");
    }
    
    plhs[0] = mxCreateDoubleMatrix(size,size,mxREAL);
    out = mxGetPr(plhs[0]);
    
    for (c = 0; c < size; c++) {
          for (d = 0; d < size; d++) {
            for (k = 0; k < size; k++) {
            sum = sum + first[c+k*size]*second[d*size+k];
            }
            out[d*size+c] = sum;
            sum = 0;
          }
    }

    return;
}