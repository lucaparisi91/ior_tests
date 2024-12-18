#!/bin/bash

# Slurm job options (job-name, compute nodes, job time)
#SBATCH --job-name=ior_small
#SBATCH --time=0:20:0
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=standard
#SBATCH --qos=short

export SRUN_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK
module load xthi
module use ../modules
module load ior
#module load darshan/3.4.6

export DARSHAN_LOG_DIR_PATH=$(pwd)/logs
export DARSHAN_CONFIG_PATH=$(pwd)/darshan.cfg
export DARSHAN_MOD_ENABLE="DXT_POSIX,DXT_MPIIO"

SOURCE_DIR=$(pwd)

cd /mnt/lustre/a2fs-work4/work/z19/z19/lparisi/io_posix

srun --hint=nomultithread --distribution=block:block ior -f $SOURCE_DIR/singleProcessWrite.ini

#srun --hint=nomultithread --distribution=block:block ior -v -w -r -k -t 1m -b 1m -s 1 -e


#srun --hint=nomultithread --distribution=block:block ior -v -r -k -t 1m -b 1m -s 160 -e

# io striped
#srun --hint=nomultithread --distribution=block:block ior -v -w -k -t 1m -b 1m -s 160 -e


# DIRECT io striped
#srun --hint=nomultithread --distribution=block:block ior -v -W -w -t 160m -b 160m -s 1 -e -O useO_DIRECT=1