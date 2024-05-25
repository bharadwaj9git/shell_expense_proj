
echo -e "\e[33m installing mysql server \e[0m"
dnf install mysql-server -y

echo -e "\e[33m enabling service \e[0m"
systemctl enable mysqld

echo -e "\e[33m start service \e[0m"
systemctl start mysqld

echo -e "\e[33m setting credentials \e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1