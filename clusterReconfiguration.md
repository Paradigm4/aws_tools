# Cluster Reconfiguration

The aim of this section is to capture notes and scripts to reconfigure clusters in terms of number of instances, and the linking of instance folders to mounted disks

1. First stop the cluster
```
scidb.py stopall alisa
```

2. Remove the mounted directories

```
# From node 0
NUMDISKSPERNODE=6
for disk_i in $(seq 0 $((NUMDISKSPERNODE-1))); do echo "rm -rf /mnt/$disk_i/scidb_data/*";  done

# From other nodes: Assuming REMOTE is defined as list of remote IP-s and
# that the local disks are mounted at /mnt/0/scidb_data and so on
j=0; for ip in $REMOTE; do j=$((j+1)); echo $j ; for k in $(seq 0 $((NUMDISKSPERNODE - 1))); do ssh $ip "rm -rf /mnt/$k/scidb_data/*" ; done; done
```

3. Remove the scidb local directies
```
# For node 0
rm -rf scidb_data/000/

# For other nodes
j=0; for ip in $REMOTE; do j=$((j+1)); echo $j ; ssh $ip "rm -rf ~/scidb_data/00${j}" ; done
```

4. Next make the necessary changes in the config file

5. Run `initall` on cluster

6. Run the script to link instance folders to mounted folders
```
# Script must be run from the `scidb_data/00$i` folder in each node
bash /home/scidb/p4/ksen/p4tools/admin/link_disks.sh 

# Copy the folder across the nodes
for ip in $REMOTE; do scp /home/scidb/p4/ksen/p4tools/admin/link_disks.sh $ip:/tmp/ ; ssh $ip ; done
# and then while logged into each node
vi /tmp/link_disks.sh
# to change to appropriate node number. Then
bash /tmp/link_disks.sh
```
7. Load libraries

```
iquery -aq "load_library('accelerated_io_tools')"
iquery -aq "load_library('axial_aggregate')"
iquery -aq "load_library('cu')"
iquery -aq "load_library('dev_tools')"
iquery -aq "load_library('fast_count')"
iquery -aq "load_library('grouped_aggregate')"
iquery -aq "load_library('sgf_meta')"
iquery -aq "load_library('superfunpack')"
iquery -aq "load_library('system')"
```
