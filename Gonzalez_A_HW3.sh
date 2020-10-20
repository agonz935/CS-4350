#Name: Alejandra Gonzalez
#CS 4350 - Unix Systems Programming
#Assignment Number: 03
#Due Date: 10/5/2020 No Later than 5:15 pm

#!/bin/sh


#functions
yes_no() { 
while true; do
    read -p 'Try another password --- > Yy | Nn ---- > ' answer
    case "$answer" in
    y|Y)
        new_pw
        break
        ;;
    n|N)
        break
        ;; 
    *)
        echo "**** Incorrect Selection - Must select Y or N"
        ;;
   esac
done
}

#create a directory
create_dir() {
echo "Checking if directory "$dirname" exists... "

if [ ! -d "$dirname" ] 
then 
    echo "Directory does not exist. Creating now..."
    mkdir ./$dirname
    echo "Directory created"
else
    echo "Directory exists"
fi

echo "Directory info: "
 
(cd "$dirname" && pwd && ls -l -d) #not sure how much directory info was wanted, can put any directory cmd here
}

#new password function, if needed
new_pw() {

read -p 'Enter new password: -- > ' password
check_pw "$password"
}

check_pw() {
if [ ${#1} -lt 8 ] || ! [[ "$1" =~ [[:upper:]] ]] || ! [[ "$1" =~ [[:lower:]] ]] || ! [[ "$1" =~ [[:alnum:]] ]]
then
    echo 'Password entered is weak, does not meet requirements.'    
else
    echo 'Password is strong'
    echo "$1" >> "$dirname"/"$txtFile"
fi
yes_no
}

show_file() {
echo "The content of the password file is : "
if [ ! -f "$dirname"/"$txtFile" ] 
then
    echo "The file does not exist."
else
    cat "$dirname"/"$txtFile"
fi
}

delete_dir() {
if [ -d "$dirname" ] 
then
    echo ""$dirname" directory is deleted"
    rm -rf "$dirname"
else
    echo ""$dirname" does not exist"
fi
}

delete_txt() {
if [ -f "$dirname"/"$txtFile" ] 
then
    echo ""$txtFile" file is deleted"
    rm "$dirname"/"$txtFile"
    delete_txt
else
    echo ""$txtFile" file does not exist"
fi
}

#main script
password1=${1}
dirname=ZHW3
txtFile=password.txt

create_dir
echo '  '
check_pw "$password1"
echo '  '
echo '  '

show_file
echo '   '

if [ -f "$dirname"/"$txtFile" ]
then
    delete_txt #delete
fi

delete_dir #delete
delete_dir #verify

exit 0
