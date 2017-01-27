#!/bin/bash

if [ $# -lt 3 ]; then
  echo "Bad arguments provided. USE: \"logs2flume <DATA_FILE> <EVENTS PER SECOND> <DEST IP> <DEST PORT>\""
  exit 1
fi

while :
do

echo "Sending new bucle for $1 at $2 EPS to $3 port $4 ..."
cat $1 | ./eps.pl $2 | nc -q 1 $3 $4

done
