set -e
set -x
VERSION=3.4.6
source env.sh

wget https://web.cels.anl.gov/projects/darshan/releases/darshan-$VERSION.tar.gz
tar -zxvf darshan-$VERSION.tar.gz 
cd darshan-$VERSION
./prepare.sh 
cd darshan-runtime
install_dir=/work/z19/z19/lparisi/courses/io/ior_tests/opt/darshan/$VERSION

CC=mpicc ./configure --prefix=${install_dir} --with-log-path=${install_dir}/darshan-logs --with-jobid-env=SLURM_JOB_ID --with-log-path-by-env=DARSHAN_LOG_DIR_PATH  
make
make install

# Install utils for visualization. Genarating reports require pdflatex atc.. 

cd ../darshan-util
./configure --prefix=${install_dir}
make 
make install

# Creates directory structures for the log
cd ${install_dir}
mkdir darshan-logs
cd bin
./darshan-mk-log-dirs.pl
