dnf install -y nginx
echo -e "\e[25m >>>>>>>> Install Nginx <<<<<<<<<<< \e[0m"

cp nginx.conf /etc/nginx/nginx.conf

echo -e "\e[25m >>>>>>>> Copy Nginx <<<<<<<<<<< \e[0m"


curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
dnf install -y nodejs
echo -e "\e[25m >>>>>>>> Install Node js <<<<<<<<<<< \e[0m"


curl -L -o /tmp/frontend.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/frontend.zip
rm -rf /tmp/frontend
mkdir -p /tmp/frontend
cd /tmp/frontend
echo -e "\e[25m >>>>>>>> extracting the code and installing Nginx <<<<<<<<<<< \e[0m"

unzip /tmp/frontend.zip
npm install

echo -e "\e[25m >>>>>>>> Installing frontend <<<<<<<<<<< \e[0m"

npm run build
rm -rf /usr/share/nginx/html/*
cp -r out/* /usr/share/nginx/html/



systemctl restart nginx
systemctl enable nginx

echo -e "\e[25m >>>>>>>> Restarting the Nginx <<<<<<<<<<< \e[0m"
