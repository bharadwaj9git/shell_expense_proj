source common.sh
rm -rf /tmp/expense.log


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
id expense
if [ $? -ne 0 ]; then
useradd expense &>> /tmp/expense.log
fi
status $?

heading copying service file
cp backend.service /etc/systemd/system/backend.service &>> /tmp/expense.log
status $?

heading creating directory
mkdir /ap
status $?

heading downloading our own content
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>> /tmp/expense.log
status $?

heading change directory
# shellcheck disable=SC2164
cd /ap &>> /tmp/expense.log
status $?

heading unzip content
unzip /tmp/backend.zip &>> /tmp/expense.log
status $?

heading installing mysql heading
npm install
dnf install mysql - &>> /tmp/expense.log
status $?

heading setting pwd

mysql -h 34.204.77.225 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>> /tmp/expense.log
status $?

hading reloading,enabling and start service
systemctl daemon-reload &>> /tmp/expense.log
systemctl enable backend &>> /tmp/expense.log
systemctl start backend &>> /tmp/expense.log
status $?

