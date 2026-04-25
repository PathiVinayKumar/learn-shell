# this tee is to append the heading also into log file.
# declaring the variable for the log file.
log_file=/tmp/roboshop.log

echo -e "\e[35m >>>>>>>> Install Nginx <<<<<<<<<<< \e[0m" | tee -a &>>/tmp/roboshop.log 
dnf install -y nginx &>>/tmp/nginx-output  &>>{log_file}
echo $?

echo -e "\e[35m >>>>>>>> Copy Nginx <<<<<<<<<<< \e[0m" | tee -a &>>/tmp/roboshop.log
cp nginx.conf /etc/nginx/nginx.conf &>>/tmp/nginx-output-conf &>>{log_file}
echo $?


echo -e "\e[35m >>>>>>>> Install Node js <<<<<<<<<<< \e[0m" | tee -a &>>/tmp/roboshop.log
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash - &>>{log_file}
dnf install -y nodejs  &>>/tmp/roboshop.log
echo $?

echo -e "\e[35m >>>>>>>> extracting the code and installing Nginx <<<<<<<<<<< \e[0m"
curl -L -o /tmp/frontend.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/frontend.zip &>/tmp/null
rm -rf /tmp/frontend  &>>{log_file}
mkdir -p /tmp/frontend &>>{log_file}
cd /tmp/frontend &>>{log_file}
echo $?

echo -e "\e[35m >>>>>>>> Installing frontend <<<<<<<<<<< \e[0m" | tee -a &>>{log_file}
unzip /tmp/frontend.zip &>>{log_file}
npm install &>>{log_file}
echo $?


npm run build  &>>{log_file}
rm -rf /usr/share/nginx/html/* &>>{log_file}
cp -r out/* /usr/share/nginx/html/ &>>{log_file}
echo $?

echo -e "\e[35m >>>>>>>> Restarting the Nginx <<<<<<<<<<< \e[0m" | tee -a &>>{log_file}
systemctl restart nginx
systemctl enable nginx
echo $?

