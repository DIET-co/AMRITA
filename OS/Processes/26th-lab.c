#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
int main(){
    int pid;
    int arr[10];
    int i,a,square,half;
    printf("Enter a number:");
    scanf("%d",&a);

   //arr 
    for(i = 0; i < 10 ; i++){
        printf("Enter element %d",i + 1);
        scanf("%d",&arr[i]);
    }
   /* child code*/
    pid = fork();
    if(pid==0){

     printf("inside child process %d\n\n",getpid());
     square = a * a;
     printf("square of the number:%d\n\n",square);
     printf("\n");
     printf("Elements in the array are : \n");
      for(i = 0; i < 10; i++){
         printf("\n");
         printf("%d",arr[i]);
         i++;
      }
      printf("\n");
    }

    /* parent code */
    if(pid > 0){
      wait();
      printf("\nParent Process: %d \n", getppid());
      printf("\n");
      half = a / 2;
      printf("Half of the given number is:%d\n\n",half);
      printf("\n");
      printf("Elements in the array are:\n\n ");
      printf("\n");
      for(i = 0; i < 10; i++){
         printf("%d",arr[i]);
      }
      printf("\n");
      }
      return 0;

    }
