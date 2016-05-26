#!/bin/bash
mcidx=0
TotInst=80
Nodes=4
for i in $(seq 0 $((TotInst-1))); # the file index 
    do 
    mcidx=$((i/(TotInst/Nodes) + 1 ))
    if [ ${#i} -lt 2 ] ; then 
      j="0$i" ; 
    else 
      j=$i ;
    fi;  # the suffix (padded with 0 for single digit numbers)
    if [ $i -lt 20 ] ; then #salty1
        scp /public/FinancePOC/PDQ/BinaryData_tas_20150818/tas_20150818.bin.0000$j salty$mcidx:~/scidb_data_ksen/00$((mcidx-1))/$i/tas_20150818.bin & 
    elif [ $i -lt 40 ] ; then #salty2
        blockstart=20
        scp /public/FinancePOC/PDQ/BinaryData_tas_20150818/tas_20150818.bin.0000$j salty$mcidx:~/scidb_data_ksen/00$((mcidx-1))/$((i-blockstart+1))/tas_20150818.bin & 
    elif [ $i -lt 60 ] ; then #salty3
        blockstart=40
        scp /public/FinancePOC/PDQ/BinaryData_tas_20150818/tas_20150818.bin.0000$j salty$mcidx:~/scidb_data_ksen/00$((mcidx-1))/$((i-blockstart+1))/tas_20150818.bin & 
    elif [ $i -lt 80 ] ; then #salty3
        blockstart=60
        scp /public/FinancePOC/PDQ/BinaryData_tas_20150818/tas_20150818.bin.0000$j salty$mcidx:~/scidb_data_ksen/00$((mcidx-1))/$((i-blockstart+1))/tas_20150818.bin & 
    fi
done

