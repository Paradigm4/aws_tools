# Useful aliases
ALL="10.0.20.185 10.0.20.186 10.0.20.187 10.0.20.184" # List all the IP-s of the cluster
REMOTE="10.0.20.186 10.0.20.187 10.0.20.184"          # List only the remote IP-s of the cluster"

alias REMOTELOOP="for ip in \$REMOTE; do ssh \$ip; done" # Useful command to cycle through the remote nodes

# Set the terminal to behave like vi
set -o vi

# iquery aliases
alias iqlist_instances="iquery -aq \"list('instances')\""
alias iqlist_="iquery -aq \"list()\""
alias iqlist_names="iquery -aq \"project(list(), name)\""
alias iqlist_operators="iquery -aq \"list('operators')\""
alias iqlist_queries="iquery -aq \"list('queries')\""
alias iqlist_libraries="iquery -aq \"list('libraries')\""
alias iqr="iquery -aq "
alias iqnr="iquery -naq "
alias iqbuildsimple="iquery -naq \"store(build(<num:double>[x=0:8,1,0, y=0:9,1,0], random()),random_numbers)\""
