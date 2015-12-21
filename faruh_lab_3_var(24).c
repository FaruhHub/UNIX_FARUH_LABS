/*24.	Виконати копіювання вказаних файлів, імена яких є вмістом вхідного файлу, замінивши всі прописні  літери на стрічні. Вхідні параметри передати при запуску програми.*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
intcopy_file(char *in);

int main(intargc, char** argv)
{
	inti;

	char imput_file[200]="", str[200]="";
	FILE *fin;	
	system("clear");
	do{
		printf("Введите имя входного файла: ");
		gets(imput_file);
		//printf("Читаем %s",imput_file);
fin = fopen(imput_file,"r");
	} while(fin == NULL);
	i = 0;
	while(fscanf(fin,"%s",str) != EOF)
	{
		if(copy_file(str))
			printf("Файл %s не продублирован\n",str);
		else
			printf("Файл %s продублирован\n",str);
	}

	fclose(fin);
	printf("\n\n");
	return 0;
}

intcopy_file(char *in)
{	
	FILE *f,*fc;
	int n=0,i=0;
	charkop[200]="", str[200]="", name;
	
strcpy(kop,"Копия ");
	n = strlen(in);
for (i=n;i>=0;i--)
if (in[i] == '/')
break;

strcat(kop,in+i+1);
printf("\nЧитаем %s\n",kop);
    f = fopen(in,"r");
	if (f == NULL)
		return 1;
	fc = fopen(kop,"w");

	while(fscanf(f,"%s",str) != EOF)
	{
		n = strlen(str);
		
for (i=0;i<n;i++)
        {
str[i]=tolower(str[i]);
        }
fprintf(fc,"%s\n",str);
    }
	fclose(f);
	fclose(fc);		
	return 0;
}
