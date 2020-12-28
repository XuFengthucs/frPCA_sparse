#!/bin/bash
echo "Please choose the compiler (icc/gcc)"
read compiler
if [ "$compiler"x = "icc"x ];
then
    source /opt/intel/bin/iccvars.sh intel64
    icc -O3 -mkl -qopenmp -w frpca.c frpca_test.c matrix_vector_functions_intel_mkl_ext.c matrix_vector_functions_intel_mkl.c -o frpca_test 
else if [ "$compiler"x = "gcc"x ];
then 
    gcc -O3 -m64 -I/opt/intel/mkl/include frpca.c frpca_test.c matrix_vector_functions_intel_mkl_ext.c matrix_vector_functions_intel_mkl.c -Wl,--start-group /opt/intel/mkl/lib/intel64/libmkl_intel_lp64.a /opt/intel/mkl/lib/intel64/libmkl_intel_thread.a /opt/intel/mkl/lib/intel64/libmkl_core.a -Wl,--end-group -L/opt/intel/compiler/lib/intel64 -liomp5 -lpthread -ldl -lm -fopenmp -w -o frpca_test
else
    echo "Compiler error!"
fi
fi
