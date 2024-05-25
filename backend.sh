dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
useradd expense
cp backend.service /etc/systemd/system/backend.service
mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
# shellcheck disable=SC2164
cd /app
unzip /tmp/backend.zip
npm install
dnf install mysql -y
mysql -h 34.235.121.204 -uroot -pExpenseApp@1 < /app/schema/backend.sql
systemctl daemon-reload
systemctl enable backend
systemctl start backend

