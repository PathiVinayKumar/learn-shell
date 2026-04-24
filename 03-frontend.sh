echo -e "\e[35m >>>>>>>> Install Nginx <<<<<<<<<<< \e[0m" | tee -a &>>/tmp/roboshop.log
dnf install -y nginx &>>/tmp/nginx-output  &>>/tmp/roboshop.log

echo -e "\e[35m >>>>>>>> Copy Nginx <<<<<<<<<<< \e[0m" | tee -a &>>/tmp/roboshop.log
cp nginx.conf /etc/nginx/nginx.conf &>>/tmp/nginx-output-conf &>>/tmp/roboshop.log


echo -e "\e[35m >>>>>>>> Install Node js <<<<<<<<<<< \e[0m" | tee -a &>>/tmp/roboshop.log
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash - &>>/tmp/roboshop.log
dnf install -y nodejs  &>>/tmp/roboshop.log

echo -e "\e[35m >>>>>>>> extracting the code and installing Nginx <<<<<<<<<<< \e[0m"
curl -L -o /tmp/frontend.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/frontend.zip &>/tmp/null
rm -rf /tmp/frontend  &>>/tmp/roboshop.log
mkdir -p /tmp/frontend &>>/tmp/roboshop.log
cd /tmp/frontend &>>/tmp/roboshop.log

echo -e "\e[35m >>>>>>>> Installing frontend <<<<<<<<<<< \e[0m" | tee -a &>>/tmp/roboshop.log
unzip /tmp/frontend.zip &>>/tmp/roboshop.log
npm install &>>/tmp/roboshop.log


npm run build  &>>/tmp/roboshop.log
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log
cp -r out/* /usr/share/nginx/html/ &>>/tmp/roboshop.log

echo -e "\e[35m >>>>>>>> Restarting the Nginx <<<<<<<<<<< \e[0m" | tee -a &>>/tmp/roboshop.log
systemctl restart nginx
systemctl enable nginx

