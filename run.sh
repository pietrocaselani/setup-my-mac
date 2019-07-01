#!/usr/bin/env bash

function helpFunction() {
   echo ""
   echo "Usage: $0 -n \"Blob Fullname\" -e blob@email.com -c \"Blob's Macbook\""
   echo -e "\t-n Git user name"
   echo -e "\t-e Git user email"
   echo -e "\t-c Computer name"
   exit 1
}

while getopts "n:e:c:" opt; do
   case "$opt" in
      n ) gitUserName="$OPTARG" ;;
      e ) gitUserEmail="$OPTARG" ;;
      c ) computerName="$OPTARG" ;;
      ? ) helpFunction ;;
   esac
done

if [ -z "$gitUserName" ] || [ -z "$gitUserEmail" ] || [ -z "$computerName" ]; then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

computerName="${computerName// /-}"
computerName="${computerName//\'}"
computerName="${computerName//.}"
computerName="${computerName//,}"

echo "Git user name: ${gitUserName}"
echo "Git user email: ${gitUserEmail}"
echo "Computer name: ${computerName}"
echo "Local host name: ${computerName}"
echo "Looks good? [y/n]"
read -r response

if [[ $response =~ ^([yY])$ ]]; then
   ansible-playbook --connection=local setup.yml --extra-vars "git_user_name='${gitUserName}' git_user_email='${gitUserEmail}' computer_name='${computerName}' local_host_name='${computerName}'"
else
   echo "Ok, bye"
fi
