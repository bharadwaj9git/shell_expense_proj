source common.sh
rm -rf /tmp/expense.log


heading disabling old version
dnf module disable nodejs -y &>> /tmp/expense.log
stat #?

heading enabling new version
dnf module enable nodejs:20 -y &>> /tmp/expense.log
stat #?

heading installing node
dnf install nodejs -y &>> /tmp/expense.log
stat #?

heading user add
useradd shell-pr &>> /tmp/expense.log
stat #?

heading copying service file
cp backend.service /etc/systemd/system/backend.service &>> /tmp/expense.log
stat #?

heading creating directory
mkdir /ap
stat #?

heading downloading our own content
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>> /tmp/expense.log
stat #?

heading change directory
# shellcheck disable=SC2164
cd /ap &>> /tmp/expense.log
stat #?

heading unzip content
unzip /tmp/backend.zip &>> /tmp/expense.log
stat #?

heading installing mysql heading
npm install
dnf install mysql - &>> /tmp/expense.log
stat #?

heading setting pwd

mysql -h 34.204.77.225 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>> /tmp/expense.log
stat #?

hading reloading,enabling and start service
systemctl daemon-reload &>> /tmp/expense.log
systemctl enable backend &>> /tmp/expense.log
systemctl start backend &>> /tmp/expense.log
stat #?

