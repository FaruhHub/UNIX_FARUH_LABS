/*23.	Для вказаної директорії, ім’я якої передається при запуску програми,
 виконати сортування за кількістю жорстких посилань об’єкта. */
#include <stdio.h>
#include <dirent.h>
#include <string.h>
#include <fcntl.h>
#include <pwd.h>

int main(int argc, char **argv)
{
char filename[NAME_MAX];
DIR *dfd;
FILE* fp;
struct stat fileattrib; 
struct passwd *pw_d;
struct dirent *dp;
int i,j;
char *namenlink[100][2], *buff;

	if ( argc < 2 )
		strcpy(filename, ".");
	else
		strcpy(filename, argv[1]);

	dfd=opendir(filename);
	if(dfd==0)
		{
			printf("Invalid path or directory: '%s'\n",filename);
			//exit(0);
		}
	printf("Befor sorting:\nFile name | NLink count\n\n");
		i=0;
		while( (dp=readdir(dfd)) != NULL )
		{
			if(stat(dp->d_name, &fileattrib) == 0)
			if((strcmp(dp->d_name,".")!= 0)&&(strcmp(dp->d_name,"..")!= 0))
			{
						namenlink[i][0]=fileattrib.st_nlink;
						namenlink[i][1]=(dp->d_name);
						printf("%s | %d \n",namenlink[i][1], namenlink[i][0]);
						i++;
			}
		}
	printf("\nAfter sorting:\nFile name | NLink count\n\n");
		for(j=-1; j<i; j++)
		{
			if(namenlink[j][0]<namenlink[j+1][0])
				{
					buff=namenlink[j][0];
					namenlink[j][0]=namenlink[j+1][0];
					namenlink[j+1][0]=buff;
					buff=namenlink[j][1];
					namenlink[j][1]=namenlink[j+1][1];
					namenlink[j+1][1]=buff;
					j=0;
				}
		}

		for(j=0; j<i; j++)
		{
			printf("%s | %d \n",namenlink[j][1], namenlink[j][0]);
		}
	closedir(dfd);
    return 0;
}
