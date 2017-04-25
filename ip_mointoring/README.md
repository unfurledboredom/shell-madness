**IP Address Monitor**
===================
`Problem`
-------------
For those of us who do not have **static** IPs from our ISPs, figuring out our current IP address can be a hassle. Whether attempting to manage computers remotely, log into private-VPN, or simply access a page, we need our current public IP and a change in IP address can throw it all off. For many of us that means waiting until getting home and finding out the new IP address before getting anything done. 


`Solution`
-------------
I created two simple shell scripts in hopes to resolve this issue. This will run in almost all *nix systems without any issues. 

###IP Checker
The first script ``ip_check.sh`` does exactly what the name suggests. Every time it is ran, it checks the IP address, if there are any changes, it will send out an email; otherwise, it will log the results and continue. 

###Weekly Reset
The second script ``reset_weekly.sh`` goes and clears out the log files and email messages and creates a new one for the next week. 

----------

Deployment Recommendation 
-------------
> **Note:**
> - You need to pre-configure ``ssmtp`` in order to have the email functionality work. 
> -You can also use a different email client. In which case make the appriopiate adjustments to ``ip_check.sh`` script.
> - You also need to create a directory ``/monitor/IP/`` or change the script to run operate on a different directory. 

I am using the built in ``cron`` functionality of *nix. Cron is a task scheduling system (see link below). I took the ``ip_check.sh`` and placed it in the **hourly** folder for **cron**. In my system that happens to be ``/etc/cron.hourly/``. You system might differ. You can always check the crontab file at ``/etc/crontab`` for more information. Cron will execute all scripts in this folder every hour. 

Second thing I did was place the ``reset_weekly.sh`` in the **weekly** folder located at ``/etc/cron.weekly/``. The reason being, I want everything to be reset every week. 

At this point, the system is all set up to run the scripts and notify if it notices any changes to the IP address compared to what is on file. 

>Learn more about Cron: 
>https://en.wikipedia.org/wiki/