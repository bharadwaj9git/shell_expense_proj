#front end automating

echo -e "\e[33m installing nginx\e[0m"
dnf install nginx -y
echo exit status - $?

echo -e "\e[33m config file copy \e[0m"
cp frontend.conf /etc/nginx/default.d/frontend.conf
echo exit status - $?

echo -e "\e[33m removing default content \e[0m"
rm -rf /usr/share/nginx/html/*
echo exit status - $?

echo -e "\e[33m downloading our own content \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
echo exit status - $?

echo -e "\e[33m change path to nginx html \e[0m"
# shellcheck disable=SC2164
cd /usr/share/nginx/html
echo exit status - $?

echo -e "\e[33m unzip content \e[0m"
unzip /tmp/frontend.zip
echo exit status - $?

echo -e "\e[33m restarting service \e[0m"
systemctl restart nginx
echo exit status - $?

echo -e "\e[33m enabling service \e[0m"
systemctl enable nginx
echo exit status - $?



