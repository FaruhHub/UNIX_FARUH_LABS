#26 .Видалити з системи користувачів, що належать вказаним групам. Імена  груп задані в файлі. Вивести список користувачів до і після видалення. Ім’я вхідного файлу передається через командний рядок.#

#!/bin/bash
clear
echo "Удалить пользователей?"
echo " варианты: y,n "
read MYSTRING
if [ $MYSTRING = "y" ]; then
echo "Список пользователей:"
cat gr
echo
while 
	read a1
	do
	grep $a1 gr >> gr3  
	 for user in ` cat ./gr3 | cut -d: -f1,4 | sed 's/:/ /' `
	   do
		for i in `cat gr3`; do
			sed -i "/$i/d" gr
			sed -i "/$i/d" gr1
		done
	   done  
done <gr1	
	#rm -f gr3
echo "Список пользователей после:"
	cat gr

elif [ $MYSTRING = "n" ]; then
 
    echo "Как нибудь в следующий раз"
	
else
 
    echo "Таких вариантов нет!"
fi


