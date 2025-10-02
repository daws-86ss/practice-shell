#!/bin/bash


USERID=$(id -u)

if [ $USERID - eq 0]; then
    echo "ERROR: please run with root previliges"
    exit 1
fi


dnf insatll mysql -y

if [ $? - ne 0]; then
    echo "ERROR: insatlling mysql is failure"
    exit 1
else
    echo "insatlling my sql"