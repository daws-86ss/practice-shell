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
    #check whether pacakage is installed or not 
    dnf list installed $package &>>LOG_FILE
    # checking exit status
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>LOG_FILE
        VALIDATE $? "$pacakge"
    else 
        echo -e "$package installed already $Y..skipping $N"
    fi 
done
