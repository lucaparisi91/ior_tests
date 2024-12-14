help([[
ior main
==========

This module sets up your environment to access ior, mdtest and md-bench tools.

   Maintained by: L. Parisi, EPCC
]])

local pkgVersionBase = "/work/z19/z19/lparisi/courses/io/ior_tests/opt/ior"

load("PrgEnv-gnu")
load("cray-hdf5-parallel")

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))

setenv("IOR_ROOT", pkgVersionBase)