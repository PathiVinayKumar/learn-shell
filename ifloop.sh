for fruit in banana apple orange; do
echo fruit name - $fruit
done
sleep 3

x=10
while [ $x -gt 0 ]; do
echo while conidition
x=$(($x-1)) #x=x-1
done
