help([[
Darshan Runtime
==========

This module provides access to the
Darshan IO monitoring tool.


]])

load("PrgEnv-gnu")
load("cray-hdf5-parallel")

local darshan_root = "/work/z19/z19/lparisi/courses/io/ior_tests/opt/darshan/3.4.6"

setenv("DARSHAN_ROOT", darshan_root)
setenv("DARSHAN_DIR", darshan_root)

setenv("SRUN_EXPORT_ENV","ALL,LD_PRELOAD=" .. darshan_root .. "/lib/libdarshan.so")
prepend_path("PATH",darshan_root.. "/bin")
prepend_path("LD_LIBRARY_PATH",darshan_root.. "/lib")

family("darshan")

