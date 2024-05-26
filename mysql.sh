source common.sh

if [ -z "$1" ]; then
echo "input password missing"
exit 1
fi

heading installing mysql server
dnf install mysql-server -y
if [ $? -eq 0 ]; then
echo success
else
echo failure
exit 2
fi


heading enabling service
systemctl enable mysqld
if [ $? -eq 0 ]; then
echo success
else
echo failure
exit 2
fi


heading start service
systemctl start mysqld
if [ $? -eq 0 ]; then
echo success
else
echo failure
exit 2
fi


heading setting credentials
mysql_secure_installation --set-root-pass $1
if [ $? -eq 0 ]; then
echo success
else
echo failure
exit 2
fi
