# LogScraper
scrape SciDB logs to retrieve queries and timestamps

## Scrape the scidb.log to store quries and execution timestamps
```
grep -r Executing scidb.log | grep -v ": ;" | cut -d ':' -f 5- | cut -d ';' -f 1 > nodeN-queries.txt
grep -r Executing scidb.log | grep -v ": ;" | cut -d ' ' -f 2  > nodeN-times.txt
```

## Run the python script to calculate differences
```
python scraper.py nodeN-times.txt > nodeN-timediffs.txt
```

## Formulate the query stack
```
./queryStacker.sh
```

## Correct the date in the generated query stack
```
vi bunchOfQueries.sh
```
and make the following substitutions
```
%s/taq_20150611/taqPOC_20160401/g
%s/20150611/20160401/g
%s/p4\///g
```

On non-postgres nodes:
```
%s/iquery/iquery --port 1240/g
```
