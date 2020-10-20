#NAME: Alejandra Gonzalez
#CS 4350 - Unix Systems Programming
#Section Number: 01
#Assignment Number: 2
#Due Date: 9/23/2020 no later than 5:15pm



#!/bin/sh


#Functions begin here
yes_no() {
    read -p 'Run the script again Y|N - - - - > ' answer
    case "$answer" in
    y|Y)
       return 0
       ;;
    n|N)
       exit 0
       ;;
    *) 
       echo "**** Error - Must input Y or N"
       return 1
       ;;
    esac
}

add_ints(){
    sum=$(( $1 + $2 + $3 ))
    echo "$sum"
}   

mul_ints(){
    product=$(( $1 * $2 * $3))
    echo "$product"
}

div_ints(){
    quotient=$((($1 + $2 + $3)/ 3)) 
    echo "$quotient"
}

square_ints(){
    s1=$(($1 * $1))
    s2=$(($2 * $2))
    s3=$(($3 * $3))
    echo "$1*$1 = $s1 , $2*$2 = $s2 , $3*$3 = $s3"
}

pos_neg(){
p=positive
n=negative
z=zero
if [ "$1" -gt 0 ]
then
    var1=${p}
elif [ "$1" -lt 0 ] 
then var1=${n}
else
    var1=${z}
fi

if [ "$2" -gt 0 ]
then 
    var2=${p}
elif [ "$2" -lt 0 ] 
then var2=${n}
else
    var2=${z}
fi

if [ "$3" -gt 0 ]
then 
    var3=${p}
elif [ "$3" -lt 0]
then
    var3=${n}
else
    var3=${z}
fi

echo "$1 is $var1 , $2 is $var2, $3 is $var3"
}

e_o (){
r1=$(($1%2))
r2=$(($2%2))
r3=$(($3%2))

e=even
o=odd

if [ "$r1" -eq 0 ]
then 
    var1=${e}
else
    var1=${o}
fi

if [ "$r2" -eq 0 ]
then 
    var2=${e}
else
    var2=${o}
fi

if [ "$r3" -eq 0 ]
then 
    var3=${e}
else
    var3=${o}
fi

echo "$1 is $var1 , $2 is $var2 , $3 is $var3"
}

print_odd(){
val1=$(($1-1))
seq 3 2 $val1
}

print_even(){
 if [ $(( $1 % 2)) -ne 0 ]
then
  i=$(print_even $(( $1 - 1)))
  echo 1
else 
  echo "$1"
  #recursion to check next number 
fi 
}

factorial(){
if [ "$1" -gt 1 ]
 then
    last=$(factorial $(( $1 - 1)))
    echo $(( $1 * last))
else
    echo 1
fi
}

prime(){

if [ "$1" -lt 0 ] 
then 
return 0
fi

for((i=2; i<=$1/2; i++))
do
    if [ $(($1%i)) -eq 0 ]
    then
      echo "$1 is not prime"
      return 0
    else
      echo "$1 is a prime"
      return 0
    fi
done

}

intro(){
while true; do 
read -p 'Enter 3 integer Values - - - - > ' int1 int2 int3

if [ -z "$int1" ] || [ -z "$int2" ] || [ -z "$int3" ]
then
    echo 'Error - Must input 3 integer Values'
    until yes_no; do : ; done
else
    break
fi
done

echo "The integers are " $int1 $int2 $int3
}

#Main Script

intro

printf "2) $int1 + $int2 + $int3 = " 
add_ints "$int1" "$int2" "$int3"

printf "3) $int1 * $int2 * $int3 = "
mul_ints "$int1" "$int2" "$int3"

printf "4) ($int1 + $int2 + $int3) / 3 = "
div_ints "$int1" "$int2" "$int3"

printf "5) "
square_ints "$int1" "$int2" "$int3"

printf "6) "
pos_neg "$int1" "$int2" "$int3"

printf "7) "
e_o "$int1" "$int2" "$int3"

printf "8) All odd numbers between 1 and 5 are "
print_odd "$int2"

printf "9) All even bumbers between 1 and 5 are"
print_even "$int2"

printf "10) Factorial of 5 is: "
factorial "$int2"

printf "11) "
prime "$int3" 
exit 0
