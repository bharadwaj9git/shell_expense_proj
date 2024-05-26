#front end automating

source common.sh
rm -rf /tmp/expense.log

heading installing nginx
dnf install nginx -y &>> /tmp/expense.log
#echo exit status - $?

status $?

heading config file copy
cp frontend.conf /etc/nginx/default.d/frontend.conf &>> /tmp/expense.log
status $?

heading removing default content
rm -rf /usr/share/nginx/html/*  &>> /tmp/expense.log
status $?

heading downloading our own content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>> /tmp/expense.log
status $?

heading change path to nginx html
# shellcheck disable=SC2164
cd /usr/share/nginx/html &>> /tmp/expense.log
status $?

heading unzip content
unzip /tmp/frontend.zip &>> /tmp/expense.log
status $?

heading restarting service
systemctl restart nginx &>> /tmp/expense.log
status $?

heading enabling service
systemctl enable nginx &>> /tmp/expense.log
status $?



