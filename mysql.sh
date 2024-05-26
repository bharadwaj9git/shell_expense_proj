source common.sh
rm -rf /tmp/expense.log

if [ -z "$1" ]; then
echo "input password missing"
exit 1
fi

heading installing mysql server
dnf install mysql-server -y &>> /tmp/expense.log
if [ $? -eq 0 ]; then
echo success
else
echo failure
exit 2
fi


heading enabling service
systemctl enable mysqld &>> /tmp/expense.log
if [ $? -eq 0 ]; then
echo success
else
echo failure
exit 2
fi


heading start service
systemctl start mysqld &>> /tmp/expense.log
if [ $? -eq 0 ]; then
echo success
else
echo failure
exit 2
fi


heading setting credentials
mysql_secure_installation --set-root-pass $1 &>> /tmp/expense.log
if [ $? -eq 0 ]; then
echo success
else
echo failure
exit 2
fi
