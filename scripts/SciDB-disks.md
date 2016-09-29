# First write out the disk names in the config file as:

```
# Instance storage directories on Node # 3

datastore-dir-prefix-3-0=/datastore/scidb_data_/node3_inst0
datastore-dir-prefix-3-1=/datastore/scidb_data_/node3_inst1
```

# Then create the directories node by node

## Copy the config file to all the nodes

```
for ip in $REMOTE; do scp /opt/scidb/15.12/etc/config.ini $ip:/tmp/; done
```

## Next create the folders

```
# Test 
for name in `cat /tmp/config.ini | grep datastore-dir-prefix-0 | cut -d "=" -f 2`; do 
  echo $name; 
done

# actually create folders
for name in `cat /tmp/config.ini | grep datastore-dir-prefix-0 | cut -d "=" -f 2`; do 
  sudo mkdir -p $name; sudo chown scidb:scidb $name
done
```

# CAUTION!!!

Always make sure the newly created folders are empty! Otherwise `initall` will fail
