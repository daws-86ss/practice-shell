#!/bin/bash

START_TIME=$(date +%s)

sleep 50

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "total time executed: $TOTAL_TIME seconds"