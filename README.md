TODO:
-------
- Fix/check delete page/list
- Fix/check multiple checkboxes
- Add back button in questionlist
- Add editing support
- Add multiple admin user support

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
