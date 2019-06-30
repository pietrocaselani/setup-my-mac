#!/usr/bin/env bash

function helpFunction() {
   echo ""
   echo "Usage: $0 -n \"Blob Fullname\" -e blob@email.com"
   echo -e "\t-n Git user name"
   echo -e "\t-e Git user email"
   exit 1
}

while getopts "n:e:" opt; do
   case "$opt" in
      n ) gitUserName="$OPTARG" ;;
      e ) gitUserEmail="$OPTARG" ;;
      ? ) helpFunction ;;
   esac
done

if [ -z "$gitUserName" ] || [ -z "$gitUserEmail" ]; then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

ansible-playbook --connection=local setup.yml --extra-vars "git_user_name='${gitUserName}' git_user_email='${gitUserEmail}'"
