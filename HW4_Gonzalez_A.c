/*
Name: Alejandra Gonzalez
CS 4350-Unix Systems Programming
Assignment Number: 4
Due Date: 10/19/2020 No Later than 5:15 pm

The purpose of this project is to understand the difference
between compiled (C) and interpreted languages like bash script.
*/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void initialize(int array[7][7]);
void display(int array[7][7]);
void neighbors(int array[7][7]);

int main(){
    int mainArray[7][7];
    char answer;

    do {
    initialize(mainArray);
    display(mainArray);
    neighbors(mainArray);

    getchar();

    printf("Would you like to re-run the program again ( Y or N ) : ");
    scanf(" %c", &answer);
    getchar();

    while(answer != 'N' && answer != 'n' && answer != 'Y' && answer != 'y'){
        printf("Invalid. Must be Y|y or N|n \n");
        printf("Would you like to re-run the program again ( Y or N) : ");
        scanf(" %c", &answer);
    }

    }while(answer == 'Y' || answer == 'y');

    return 0;

}

//initializes array and fills it with random 0's and 1's
void initialize(int array[7][7]){
   srand(time(0));

   int i, j;


    for(i = 0; i < 7; i++){
      for(j = 0; j < 7; j++){
         array[i][j] = 0;
      }
    }

    for(i = 0; i < 7; i++){
      for(j = 0; j < 7; j++){
         array[i][j] = rand() % 2;
      }
    }
}

//displays array
void display(int array[7][7]){

    int i, j;

    for(i = 0; i < 7; i++){
      for(j = 0; j < 7; j++){
         printf("  %d  ", array[i][j]);
      }
      printf("\n");
      printf("\n");
    }
}

//counts the neighbors with a 1 in the desired element of the array
void neighbors(int array[7][7]){
    int i, j, count = 0;

  for(;;){
    count = 0;
    printf("Enter two integer indices i and j between 1 and 7 or -1 to exit");
    printf("\n");
    scanf("  %X%X", &i, &j);

    if((i == -1) || (j == -1)){
        return;
    }

    while((!((i <= 7) && (i >= 1))) || (!((j <= 7) && (j >= 1)))){
        printf("Invalid. Indices must be between 1 and 7 or -1 to exit   ");
        printf("\n");
        //printf("%d %d", i, j);
        printf("\n");
        scanf("  %X%X", &i, &j);

        if((i == -1) || (j == -1)){
            return;
        }
    }

    --i;
    --j;

    if(i != 0 && j != 0)
       if(array[i-1][j-1] == 1)
            ++count;

    if( i != 0)
        if(array[i-1][j] == 1)
            ++count;

    if(i != 0 && j != 6)
        if(array[i-1][j+1] == 1)
            ++count;

    if(j != 0)
        if(array[i][j-1] == 1)
            ++count;

    if(j != 6)
        if(array[i][j+1] == 1)
            ++count;

    if(i != 6 && j != 0)
        if(array[i+1][j-1] == 1)
            ++count;

    if(i != 6)
        if(array[i+1][j] == 1)
            ++count;

    if(i != 6 && j != 6)
        if(array[i+1][j+1] == 1)
            ++count;

    printf("Number of non-zero neighbors to element ( %d , %d ) = %d", i+1, j+1, count);
    printf("\n");
  }

}
