# cluster_tools
Tools and notes for setting up SciDB clusters.

Some notes pertain specifically to AWS and EC2.

 - `clusterReconfiguration.md` is a list of steps used to reconfigure a cluster from an `M X N` instance cluster (where `M` is the number of nodes, and `N` is the number of instances per node) to another configuration
 - `link_disks.sh` is a script used to create symlinks from instances to mounted disks
 - `aws-storage` contains a java program which creates a number of volumes of a specific size on AWS (contributed by Andriy Rokhmanov)
