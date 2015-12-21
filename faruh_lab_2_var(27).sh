#27. Вывести список процессов запущенных позже времени, заданного в командной строке. Выполнить удаление данных процессов этих.#

#!/bin/bash
if [$# -eq 0 ]
then
	echo “No parameters”
else
	echo “OK”
	list=`ps –eo “%x %p”>proc.txt`
	list=`ps –eo “%x %p”`
	n=0
for dd in $list
	do
		let n=$n+1
	done

t=$1
t1=${t:0:2}
t2=${t:3:2}
t3=${t:6:2}
let n=$n/2
echo  “procees =$n-1”
k=0
while [ $k –ne $n ]
	do 
	read A
time=${A:0:8}
id=${A:9:13}
A1=${time:0:2}
A2=${time:3:2}
A3=${time:6:2}
if [  $A1 –gt $t1 ]
	then
	echo “process id=$id”
	kill $id
fi
if [ $A1 –eq $t1 ]
	then
	if [ $A2 –eq $t2 ]
then
if [ $A3 –gt $t3 ]
then
		echo “process id=$id”
		kill $id
		fi
fi
		fi
if [ $A1 –eq $t1 ]
	then
	if [ $A2 –gt $t2 ]
then
		echo “process id=$id”
		kill $id
fi
		fi
let k=$k+1
done<proc.txt
fi


