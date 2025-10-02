#!/bin/bash

echo "please enter the number: "
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "given mumber $NUMBER is even"
else
    echo "given mumber $NUMBER is odd"
fi