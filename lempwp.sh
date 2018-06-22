#! /bin/bash

# Set Variables
IP=$(curl -4 -s icanhazip.com)
MYSQLROOTPASS="$(openssl rand -base64 12)"
PASSWDDB="$(openssl rand -base64 12)"

# Display random generated passwords 
clear
echo -e "\e[31mPlease enter the following information into a password manager.  You will only see it once!\e[0m"
echo 
echo -e "\e[32mMySQL Root Password\e[0m"
echo $MYSQLROOTPASS
echo 
echo -e "\e[32mWordpress DB Password\e[0m"
echo $PASSWDDB
echo
read -p "Press [Enter] key to continue"

# Install packages
yum update -y
yum -y install epel-release
yum -y install nginx
yum -y install wget
yum -y install php php-mysql php-fpm
yum -y install mariadb-server mariadb

# Start services and set them to start on boot
systemctl start nginx
systemctl enable nginx
systemctl start mariadb
systemctl enable mariadb

# Open port 80 
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload

# Edit php.ini
sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php.ini

# Edit PHP www.conf to use nginx not apache
sed -i '/listen = 127.0.0.1:9000/a \listen = /var/run/php-fpm/php-fpm.sock' /etc/php-fpm.d/www.conf
sed -i -e "s/;listen.owner = nobody/listen.owner = nginx/" /etc/php-fpm.d/www.conf
sed -i -e "s/;listen.group = nobody/listen.group = nginx/" /etc/php-fpm.d/www.conf
sed -i -e "s/user = apache/user = nginx/" /etc/php-fpm.d/www.conf
sed -i -e "s/group = apache/group = nginx/" /etc/php-fpm.d/www.conf

# Download Wordpress 
wget https://wordpress.org/latest.tar.gz

# Untar wordpress and move all contents to /usr/share/nginx/html/
sudo tar -zxvf latest.tar.gz -C /usr/share/nginx/html
mv /usr/share/nginx/html/wordpress/* /usr/share/nginx/html

# NEED TO TEST MORE mv /root/wp-config.php /usr/share/nginx/html/

# Set ownership and permissions
sudo chown -R nginx:nginx /usr/share/nginx/html/
sudo chmod -R 755 /usr/share/nginx/html/

# Copy nginx conf to /etc/nginx/conf.d/ 
cp /root/default.conf /etc/nginx/conf.d/ 

# Get IPv4 address and add it to default.conf
sed -i -e "s/server_name CHANGEME;/server_name $IP/" /etc/nginx/conf.d/default.conf

# Restart and check php and nginx 
service php-fpm restart
service nginx restart
chkconfig php-fpm on
chkconfig nginx on

unset MYSQLROOTPASS
unset PASSWDDB
