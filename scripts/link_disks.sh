#!/bin/bash
# Useful script for cluster reconfiguration (mapping SciDB instance folders to disks)
## NOTES
# 1. Must run this script from the `scidb_data/001` folder or equivalent
# 2. NODENUM (node number) must be single digit for this script to work 
# 3. NUMDISKS should be a factor of NUMINSTANCES for this script to work; not required in general though

NODENUM=0
NUMDISKS=5
NUMINSTANCES=20   # This is the number of instances per node
BASEPATH="/home/scidb/scidb_data/"

if [ $NODENUM -eq 0 ] 
then 
  START=0
else
  START=1
fi
nSTART=$START
FAC=$(( NUMINSTANCES / NUMDISKS ))

echo "START"
echo $START
echo "FAC"
echo $FAC



for j in $(seq 0 $((NUMDISKS-1)))
  do
  echo "sudo mkdir -p /mnt/$j/scidb_data/00$NODENUM"
  echo "sudo chown scidb:scidb /mnt/$j/scidb_data/"
  echo "sudo chown scidb:scidb /mnt/$j/scidb_data/00$NODENUM"
  nEND=$((nSTART + FAC - 1))
  for i in $(seq ${nSTART} ${nEND}) ; 
  do 
    echo "mv $i /mnt/$j/scidb_data/00$NODENUM/; ln -sf /mnt/$j/scidb_data/00$NODENUM/$i . "; 
  done
  nSTART=$(( nEND + 1 ))
done
