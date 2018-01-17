#!/bin/bash

#Load some dummy data into Redis
#not using redis-cli or nc because the assignment
#said "a self written script by yourself"

key="lastwrite"
value="$(date +%F_%T)"
ipaddress="127.0.0.1"
port="6379"

MESSAGE="set $key $value"

#open fd
if ! exec 3<> /dev/tcp/$ipaddress/$port
then
  exit 1
fi

#write key/value
echo -e $MESSAGE >&3

#read response
if ! read -t 2 -u 3 MESSAGE
then
  echo "Response read error"
  exit 1
fi

#close fd
exec 3<&-
exec 3>&-

if [ "${MESSAGE:0:3}" == "+OK" ]
then
  echo "Write successful."
else
  echo "Write error: $MESSAGE"
fi
