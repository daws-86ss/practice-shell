#!/bin/bash




USERID=$(id -u)


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOGS_FOLDER="/var/log/shell-script"
FILE_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$FILE_NAME.log"

mkdir -p $LOGS_FOLDER

echo "script started execututed at :$(date)"

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

dnf list installed nginx &>>$LOG_FILE
#install if it's not found
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "NGINX"
else
    echo -e "nginx is already insatlled ...  $Y skipping $N"
fi

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "mysql is already insatlled ...  $Y skipping $N"
fi
dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "PYTHON3"
else
    echo -e "python3 is already insatlled ...  $Y skipping $N"
fi