#24. Для кожного завантажувального розділу вивести : ім’я пристрою, тип розділу (основний або розширений), тип файлової системи#

#!/bin/bash
df -T > /home/probear/file.txt
sudo fdisk -l > /home/probear/file1.txt
grep ^/dev/ /home/probear/file1.txt > /home/probear/file3.txt
grep \* /home/probear/file3.txt > /home/probear/file4.txtecho 'Имя Диска Тип 	 Основной или расширенный'
while 
read a1 a2 
do 
grep $a1 /home/probear/file.txt > file5.txt
while 
read b1 b2 b3
do
a1=$a1' '$b2
done < /home/probear/file5.txt 
sim=${a1:8:1}
if [ $sim \> "5" ] 
then 
a1=$a1' Расширенный' 
else
 a1=$a1' Основной'  
fi
echo $a1 
done < /home/probear/file4.txt


