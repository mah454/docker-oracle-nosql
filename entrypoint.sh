#!/bin/sh 

export JAVA_HOME="/opt/jre" 
export PATH=$PATH:$JAVA_HOME/bin


NOSQL_HOST="0.0.0.0" 

[[ -z $NOSQL_PORT ]] && NOSQL_PORT="5000" 
[[ -z $NOSQL_STORE_NAME ]] && NOSQL_STORE_NAME="default" 

java -Xmx256m -Xms256m -jar \
    /opt/oracle-nosql/lib/kvstore.jar kvlite \
    -root /opt/oracle-nosql/$NOSQL_STORE_NAME \
    -store $NOSQL_STORE_NAME \
    -host 0.0.0.0 \
    -port $NOSQL_PORT \
    -admin-web-port -1 \
    -secure-config enable

