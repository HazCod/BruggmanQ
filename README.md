BruggmanQ
=====
BruggmanQ is a web platform that speeds up sleep data analysis drastically. It allows the user to build responsive & user-friendy surveys for patients, upload sleep data reports and process them into a report. These reports are built from templates extracted from .docx files. Administrators can manage languages, templates, questionnaires and data. For data mining purposes every parameter can be added to an Excel file.

A client can be any device accessing the web server over the wireless or wired network. The perfect example would be [a Raspberry Pi running in Kiosk mode](http://blogs.wcode.org/2013/09/howto-boot-your-raspberry-pi-into-a-fullscreen-browser-kiosk/).

TODO:
-------
From most to least important.
- Fix report generation
- Add more parameters
- Add back button on pages
- Add editing support
- Add multiple admin user support
- Cleanup & optimize code

Repository
-----------
https://github.com/HazCod/BruggmanQ

Used IDE
-----------
Netbeans 7 (standard web project)

Static login
--------------
username *admin* and password *0Bruggm4n!*

Requirements
--------------
Install apache2
Install mysql-server
Install php5 and apache-php
Enable mod_rewrite in apache2 and short tags. (Short tags should be done by the script)
Requires your web user (www-data in apache2) to be added in the sudoers group to avoid permission errors.

Add this line: *www-data ALL = NOPASSWD: /usr/bin/python2*
(He can only run python scripts in sudo)

If your web user is not www-data, change it in scripts/manage_templates.py.

Installation Instructions (on *bian/Ubuntu)
--------------------------------------
*Tested on Raspbian*

- sudo nano /etc/network/interfaces  *(set a static IP)*
- sudo service networking restart

- sudo apt-get update
- sudo apt-get install apache2 mysql-server php5 libapache2-mod-php5 git python

- sudo rm -f /var/www/index.html
- git clone https://github.com/HazCod/BruggmanQ.git

- groupadd www-data
- usermod -g www-data www-data

- a2enmod rewrite
- sudo service apache2 restart

- sudo apt-get install phpmyadmin *(optional)*
- sudo service mysqld start

- sudo apt-get install python-xlrd
- sudo apt-get install python-xlwt
- sudo apt-get install pip
- sudo pip install xlutils
- sudo pip install jinja2

- sudo wget http://downloads.sourceforge.net/project/docfrac/docfrac/4.0.1/docfrac-4.0.1.src.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fdocfrac%2F&ts=1401205200&use_mirror=heanet docfrac.tar.gz
- sudo tar -zxvf docfrac.tar.gz
- cd docfrac/
- sudo apt-get install libboost-all-dev
- sudo make install clean

- sudo chown -R www-data:www-data /var/www

- setup mySQL (using phpMyadmin?) to contain the right user stored in application/config.php
