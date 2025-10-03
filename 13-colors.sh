#!/bin/bash




USERID=$(id -u)


R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0m

if [ $USERID -ne 0 ]; then
    echo "ERROR:run the script with root previliges"
    exit 1
fi



VALIDATE(){
    if [ $1 -ne 0 ]; then
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

