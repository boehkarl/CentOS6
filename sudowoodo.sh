#!/bin/bash

#grep through the target file for common security alert words 
counter(){
  grep -iE 'fail|error|denied|unauthorized|attack|intrusion|suspect' $1 |
  sort -r
}

#grep through the target file for ip addresses
rock_throw(){
  grep -E '\b([0-9]{1,3}\.){3}[0-9]{1-3}\b' $1
}

#display menu for if user enters no arguments or bad arguments
menu(){
  echo "MENU"
  echo "Option s for security alerts"
  echo "Option i for ip address search"
  echo "Option x for secret option!!"
  echo "Filename must be first argument"
  echo "Option will be second argument"
}

echo "Sudowoodo : )"
case $2 in
  s) counter $1;;
  i) rock_throw $1;;
  x) secret_funct $1;;
  "") menu;;
  *) menu;;
;;
esac
