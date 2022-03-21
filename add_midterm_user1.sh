#!/bin/bash
#Bash script that will make newuser accounts with passwords that are at least 8 characters long
#Superuser privileges are required to run this program
if [[ "${UID}" -ne 0 ]]
then 
  echo 'Please run with sudo or as root.'
  exit 1
fi
  

#Get the username (login).
read -p 'Enter the username to create: ' USER_NAME

#Get the password.
read -p 'Enter the password to use for the account: ' PASSWORD

#Create the account.
useradd -c "${COMMENT}" -m ${USER_NAME}

#Takes 2 inputs (Username and password)
#Validate the password so it is at least 8 characters long (use a while loop and If-else condition)

#Set the password
usermod -p ${PASSWORD} ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
  echo 'The password for the account could not be set.'
  exit 1
fi
# Check if minimum length is 8 characters
string=$1
if [[ ${#string} -le 8 ]];
then
  echo "Not Valid"

# Check if string contains at least one numeric character 
# and the specified non-alphanumeric parameters (@#$%&*!)
elif [[ $1 =~ .*[0-9].* ]] && [[ "$1" =~ ['@#$%&*!'] ]];
then
  echo "Valid"
else
	echo "Not Valid"
fi
#Print the new user's username and password in the terminal
#Display the username, password, and the host where the user was created.
echo
echo 'username:'
echo ${USER_NAME}
echo
echo 'password:'
echo ${PASSWORD}
exit 1
#Upload the script in to your Github repository 
#Past
