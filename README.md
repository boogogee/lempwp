#  Wordpress on Centos 7 using Nginx

Clone this to your loacl machine and then scp this to a fresh server using scp

Remember to set up limited users and properly secure.

You will need to setup the database here is an example:

Setup root pass word and answer yes to the rest.

`mysql_secure_installation`

Next, run the following to create a user and DB for wordpress to use.

```CREATE USER wordpressuser@localhost;
CREATE DATABASE wordpress;
SET PASSWORD FOR wordpressuser@localhost= PASSWORD("CHANGE_ME");
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'CHANGE_ME';
FLUSH PRIVILEGES;```

