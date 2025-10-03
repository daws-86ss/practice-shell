#!/bin/bash




USERID=$(id -u)


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR:run the script with root previliges"
    exit 1
fi



VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 is.... $R failure $N"
        exit 1
    else
        echo -e "installing $2 is.... $G success $N"
    fi
}

dnf list installed nginx
#install if it's not found
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo -e "nginx is already insatlled ...  $Y skipping $N"
fi

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "mysql is already insatlled ...  $Y skipping $N"
fi
dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "PYTHON3"
else
    echo -e "python3 is already insatlled ...  $Y skipping $N"
fi

