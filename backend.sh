
echo -e "\e[33m disabling old version \e[0m"
dnf module disable nodejs -y

echo -e "\e[33m enabling new version \e[0m"
dnf module enable nodejs:20 -y

echo -e "\e[33m installing node \e[0m"
dnf install nodejs -y

echo -e "\e[33m user add \e[0m"
useradd shell-pr

echo -e "\e[33m copying service file \e[0m"
cp backend.service /etc/systemd/system/backend.service

echo -e "\e[33m creating directory \e[0m"
mkdir /ap

echo -e "\e[33m downloading our own content \e[0m"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip

echo -e "\e[33m change directory \e[0m"
# shellcheck disable=SC2164
cd /ap

echo -e "\e[33m unzip content \e[0m"
unzip /tmp/backend.zip

echo -e "\e[33m installing mysql \e[0m"
npm install
dnf install mysql -y

echo -e "\e[33m setting pwd \e[0m"

mysql -h 34.204.77.225 -uroot -pExpenseApp@1 < /app/schema/backend.sql

echo -e "\e[33m reloading,enabling and start service \e[0m"
systemctl daemon-reload
systemctl enable backend
systemctl start backend

