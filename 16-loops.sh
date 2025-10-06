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

echo "script started execututed at :$(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:run the script with root previliges"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 is.... $R failure $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "installing $2 is.... $G success $N" | tee -a $LOG_FILE
    fi
}


for package in $@
do
# check if package is installed or not
dnf installed $package &>>LOG_FILE
# if package is installed exit code is 0, otherwise need to install the pacakge.
if [ $? -ne 0 ]; then
    dnf insatll $package -y &>>LOG_FILE
    VALIDATE $? "$package"
else 
    echo -e "$package is installed already..$Y skipping $N"
done
