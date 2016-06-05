Log scraping scripts

INPUT:
In this project, four log files from four nodes of a SciDB cluster were provided as input. In the original run, multiple R worker nodes were issuing queries to SciDB via doRedis (the queries were issued to one of four coordinator instances -- hence we had to consult four SciDB logs).

OBJECTIVE:
The objective was to scrape the log files, and simulate a similar condition of concurrent workload (without the R worker nodes and doRedis).

SOLUTION:
 - The script `splitfile.sh` scrape the log files to read off the important queries and then split them into `NUMSPLITS` number of files. The `TAG` is used to separate the query files according to node number e.g. 59, 60, 61, 62
 - `common_queries.sh`: common queries prepended at the beginning of each real work query (due to query issuing via SciDBR)
 - The scripts are manually copied off to the relevant nodes
 - The `launch.sh` script is then manually fired off at the different nodes to simulate the concurrent workload
 
EXAMPLE:
 - `queries_59_1.*` are provided as an example of intermediate and final output

NOTE:
 - `attempt1_py` folder captures initial attempt by using Python calculations, sleep at appropriate times, but not forking processes
