source common.sh
rm -rf /tmp/expense.log

if [ -z "$1" ]; then
echo "input password missing"
exit 1
fi


heading disabling old version
dnf module disable nodejs -y &>> /tmp/expense.log
status $?

heading enabling new version
dnf module enable nodejs:20 -y &>> /tmp/expense.log
status $?

heading installing node
dnf install nodejs -y &>> /tmp/expense.log
status $?

heading adding user
id expense &>> /tmp/expense.log
if [ $? -ne 0 ]; then
useradd expense &>> /tmp/expense.log
fi
status $?

heading copying service file
cp backend.service /etc/systemd/system/backend.service &>> /tmp/expense.log
status $?

heading removing old directory
rm -rf /app &>> /tmp/expense.log
status $?

heading creating new directory
mkdir /app &>> /tmp/expense.log
status $?

heading downloading our own content
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>> /tmp/expense.log
status $?

heading change directory
# shellcheck disable=SC2164
cd /app &>> /tmp/expense.log
status $?

heading unzip content
unzip /tmp/backend.zip &>> /tmp/expense.log
status $?

heading installing mysql
#npm install
dnf install mysql -y  &>> /tmp/expense.log
status $?

heading setting pwd

mysql -h 34.204.77.225 -uroot $1 < /app/schema/backend.sql &>> /tmp/expense.log
status $?

hading reloading,enabling and start service
systemctl daemon-reload &>> /tmp/expense.log
systemctl enable backend &>> /tmp/expense.log
systemctl start backend &>> /tmp/expense.log
status $?

