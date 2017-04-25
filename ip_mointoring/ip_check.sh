#!/bin/sh
OLD_IP="$(head /monitor/IP/currentIp.txt)"
dateAndTime="$(date)"
emailAddress="yourname@emaildomain.com"

#Use a site that will return just the IP address as text
ipValue="$(curl https://ipv4.icanhazip.com)"

if [ "$OLD_IP" = "$ipValue" ]; then
    echo "$dateAndTime : Same IP $ipValue" >> /monitor/IP/ipchecklog.txt
else
	echo "$dateAndTime : IP Changed from $OLD_IP to $ipValue" >> /monitor/IP/ipchecklog.txt
	echo "$dateAndTime : IP Changed from $OLD_IP to $ipValue" >> /monitor/IP/msg.txt
	echo "$ipValue" > /monitor/IP/currentIp.txt
	#Send an email with the changes
	/usr/sbin/ssmtp $emailAddress < /monitor/IP/msg.txt
fi