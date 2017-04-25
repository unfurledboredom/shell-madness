#!/bin/sh
dateAndTime="$(date)"
emailAddress="yourname@emaildomain.com"
message=/monitor/IP/msg.txt

#remove the weekly log file
rm /monitor/IP/ipchecklog.txt
#create a new email template
echo "To: $emailAddress" > $message
echo "From: $emailAddress" >> $message
echo "Subject: Server Status Update" >> $message
echo "" >> $message
echo "$dateAndTime : Logs Reset" >> $message