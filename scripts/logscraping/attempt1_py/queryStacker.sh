#/bin/bash
stackFile="bunchOfQueries.sh"
rm $stackFile
numqueries=$(cat nodeN-queries.txt | wc -l)
for i in $(seq 1 $numqueries);
do
  echo -n "sleep " >> $stackFile
  head -n $i nodeN-timediffs.txt | tail -n 1 >> $stackFile
  echo "" >> $stackFile
  echo -n "iquery -naq \"" >> $stackFile
  head -n $i nodeN-queries.txt | tail -n 1 >> $stackFile
  echo "\" &" >> $stackFile
done
