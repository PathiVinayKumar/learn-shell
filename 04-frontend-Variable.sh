# this tee is to append the heading also into log file.
# declaring the variable for the log file.
log_file=/tmp/roboshop.log
hs="\e[35m >>>>>>>>"
he="<<<<<<<<<<< \e[0m"

echo -e "${hs} Install Nginx ${he}" | tee -a &>>/tmp/roboshop.log 
dnf install -y nginx &>>/tmp/nginx-output  &>>{log_file}
echo $?

echo -e "${hs} Copy Nginx ${he}" | tee -a &>>/tmp/roboshop.log
cp nginx.conf /etc/nginx/nginx.conf &>>/tmp/nginx-output-conf &>>{log_file}
echo $?


echo -e "${hs} Install Node js ${he}" | tee -a &>>/tmp/roboshop.log
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash - &>>{log_file}
dnf install -y nodejs  &>>/tmp/roboshop.log
echo $?

echo -e "${hs} extracting the code and installing Nginx ${he}"
curl -L -o /tmp/frontend.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/frontend.zip &>/tmp/null
rm -rf /tmp/frontend  &>>{log_file}
mkdir -p /tmp/frontend &>>{log_file}
cd /tmp/frontend &>>{log_file}
echo $?

echo -e "${hs} Installing frontend ${he}" | tee -a &>>{log_file}
unzip /tmp/frontend.zip &>>{log_file}
npm install &>>{log_file}
echo $?


npm run build  &>>{log_file}
rm -rf /usr/share/nginx/html/* &>>{log_file}
cp -r out/* /usr/share/nginx/html/ &>>{log_file}
echo $?

echo -e "${hs} Restarting the Nginx ${he}" | tee -a &>>{log_file}
systemctl restart nginx
systemctl enable nginx
echo $?

