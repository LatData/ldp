#!/bin/bash
echo "Truncating ldplatform logs..."
find $LDP_HOME -name \*.log -o -name \*.out  |xargs truncate --size=0
find $LDP_HOME -name \*.log.* -o -name \*.out.*  |xargs rm -rf
echo "Trucated..."
