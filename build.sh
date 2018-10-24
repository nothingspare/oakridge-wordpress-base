#!/bin/sh

if [ -z "$1" ]
  then
    echo "No argument supplied"
else
    docker build -t $1 .
fi
