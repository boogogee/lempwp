echo mariadb database name?
read USER_DB_NAME
echo mariadb username?
read USER_DB_USER
echo password?
read -sp ':' USER_DB_PASSWORD

yum update && yum upgrade -y
yum -y install epel-release
yum -y install nginx
yum -y install wget
yum -y install php php-mysql php-fpm
yum -y install mariadb-server mariadb

systemctl start nginx
systemctl enable nginx
systemctl start mariadb
systemctl enable mariadb

firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload


sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php.ini


sed -i '/listen = 127.0.0.1:9000/a \listen = /var/run/php-fpm/php-fpm.sock' /etc/php-fpm.d/www.conf
sed -i -e "s/;listen.owner = nobody/listen.owner = nginx/" /etc/php-fpm.d/www.conf
sed -i -e "s/;listen.group = nobody/listen.group = nginx/" /etc/php-fpm.d/www.conf
sed -i -e "s/user = apache/user = nginx/" /etc/php-fpm.d/www.conf
sed -i -e "s/group = apache/group = nginx/" /etc/php-fpm.d/www.conf
sed -i -e "s/TEMP_DB_NAME/$USER_DB_NAME/" /root/wp-config.php
sed -i -e "s/TEMP_DB_USER/$USER_DB_USER/" /root/wp-config.php
sed -i -e "s/TEMP_DB_PASSWORD/$USER_DB_PASSWORD/" /root/wp-config.php

wget https://wordpress.org/latest.tar.gz
sudo tar -zxvf latest.tar.gz -C /usr/share/nginx/html
mv /usr/share/nginx/html/wordpress/* /usr/share/nginx/html
#mv /root/wp-config.php /usr/share/nginx/html/
sudo chown -R nginx:nginx /usr/share/nginx/html/
sudo chmod -R 755 /usr/share/nginx/html/
cp /root/default.conf /etc/nginx/conf.d/ 
IP=$(curl -4 -s icanhazip.com)
sed -i -e "s/server_name CHANGEME;/server_name $IP/" /etc/nginx/conf.d/default.conf
service php-fpm restart
service nginx restart
chkconfig php-fpm on
chkconfig nginx on

