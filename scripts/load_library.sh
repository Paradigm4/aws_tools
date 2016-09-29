#/bin/bash

for name in accelerated_io_tools dense_linear_algebra dev_tools equi_join grouped_aggregate limit linear_algebra mpi namespaces stream summarize system ; do 
  iquery -aq "load_library('$name')"; 
done
