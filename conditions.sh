x=100
if [ $x = 100 ]; then 
echo success
fi

if [ $x -eq 100 ]; then
echo x is equal to 100
fi

if [ $x -gt 200 ]; then
echo x is greater than 200
else
echo x is not greater than 200
fi

if [ $x -lt 100 ]; then 
echo x is lesser than 100
else if [ $x -gt 100 ]; then 
echo x is greater than 100
else
echo give value is not greater/lesser than 100
fi