cd ior
module load PrgEnv-gnu
module load cray-hdf5-parallel

CC=cc ./configure --prefix=/work/z19/z19/lparisi/courses/io/ior_tests/opt/ior --with-lustre --with-posix --with-hdf5
make 
make install