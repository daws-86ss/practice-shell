#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: run with root previliges"
    exit 1
fi


dnf install nginx -y


VALIDATE(){
    if [ $1 -ne 0]; then
        echo "installing $2 is failure"
        exit 1
    else
        echo "installing $2 is success"
    fi
}

dnf install nginx -y
VALIDATE $? "NGINX"

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install python3 -y
VALIDATE $? "PYTHON3"