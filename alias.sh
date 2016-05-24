# Useful aliases
ALL="10.0.20.185 10.0.20.186 10.0.20.187 10.0.20.184" # List all the IP-s of the cluster
REMOTE="10.0.20.186 10.0.20.187 10.0.20.184"          # List only the remote IP-s of the cluster"

alias REMOTELOOP="for ip in \$REMOTE; do ssh \$ip; done" # Useful command to cycle through the remote nodes
