source common.sh

if [ -z "$1" ]; then
echo "input password missing"
exit
fi

heading installing mysql server
dnf install mysql-server -y

heading enabling service
systemctl enable mysqld

heading start service
systemctl start mysqld

heading setting credentials
mysql_secure_installation --set-root-pass $1