#23.	Серед усіх копій файлу залишити тільки один дата модифікації якого найновіша, інші #файли видалити з підтвердженням. Дії виконувати в поточній директорії. Результат записати в #нову директорію.#
#!/bin/bash
files=`find * -maxdepth 1 -type f -exec ls -d --full-time "{}" \; | sort -nk7 | awk '{ print $9}'`
for i in $files
do 
	for j in $files
	do
		if [[ $i != $j ]]
		then
			s1=`md5sum $i | awk '{ print $1}'`
			s2=`md5sum $j | awk '{ print $1}'`
			if [[ $s1 == $s2 ]]
			then
				echo "Older copy of file:""$i"" ""$s1"
				echo "$j"
				echo "Delete this file? (y/n)"
				read ans
				yes="y"
				if [[ $ans == $yes ]]
				then
				echo "File deleted"
				rm $j
				fi
			fi
		fi
	done
done
echo "Enter path dir for copy:"
read cpdir
cp * $cpdir

