#!/bin/bash
# Problem:
# Given data files numbered NAME.000001, NAME.000002, ...NAME.00013, .... lying in a folder, we would like to copy these files across
# the SciDB instance folders as INSTANCEFOLDER/NAME so that we can kick off parallel load as input(SCHEMA, -1, 'NAME', ...).
# This script allows that in an automated fashion. Note that the script does the work sequentially, and you can also try forking the processes 
# by removing the comment at the end of each `scp` command

# Begin: USER INPUTS
TotInst=80  # total number of instances (Assumption: This matches the number of files. Not necessary. Script needs minor modification in that case)
Nodes=4     # test was run on salty. Hence the names of nodes salty1, salty2... in comments below.    
FOLDER="/public/FinancePOC/PDQ/BinaryData_tas_20150818/taq_data"
NAME="tas_20150818.bin"
# End: USER INPUTS

mcidx=0
for i in $(seq 0 $((TotInst-1))); # the file index 
    do 
    mcidx=$((i/(TotInst/Nodes) + 1 ))
    if [ ${#i} -lt 2 ] ; then 
      j="0$i" ; 
    else 
      j=$i ;
    fi;  # the suffix (padded with 0 for single digit numbers)
    if [ $i -lt 20 ] ; then #salty1
        scp $FOLDER/$NAME.0000$j salty$mcidx:~/scidb_data_ksen/00$((mcidx-1))/$i/$NAME #& 
    elif [ $i -lt 40 ] ; then #salty2
        blockstart=20
        scp $FOLDER/$NAME.0000$j salty$mcidx:~/scidb_data_ksen/00$((mcidx-1))/$((i-blockstart+1))/$NAME #& 
    elif [ $i -lt 60 ] ; then #salty3
        blockstart=40
        scp $FOLDER/$NAME.0000$j salty$mcidx:~/scidb_data_ksen/00$((mcidx-1))/$((i-blockstart+1))/$NAME #& 
    elif [ $i -lt 80 ] ; then #salty3
        blockstart=60
        scp $FOLDER/$NAME.0000$j salty$mcidx:~/scidb_data_ksen/00$((mcidx-1))/$((i-blockstart+1))/$NAME #& 
    fi
done

