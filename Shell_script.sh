#front end automating

echo -e "\e[31m installing nginx\e[0m"
dnf install nginx -y
cp frontend.conf /etc/nginx/default.d/frontend.conf
rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
systemctl restart nginx
systemctl enable nginx


