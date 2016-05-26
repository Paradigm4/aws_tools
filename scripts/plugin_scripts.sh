# Scripts while manually deploying SciDB plugins across a multi-node cluster

# First extract the library name from the lib*.so file, and verify it
NAME=`ls lib*.so | sed "s/lib\(.*\).so/\1/"`
echo $NAME

# Copy the script across the cluster
for ip in $ALL; do sudo scp lib$NAME.so $ip:/opt/scidb/$SCIDB_VER/lib/scidb/plugins/ ; done

# Restart the cluster (if needed; Also change to appropriate DBNAME as necessary)
scidb.py stopall mydb
scidb.py startall mydb

# Load the library
iquery -aq "load_library('$NAME')"
