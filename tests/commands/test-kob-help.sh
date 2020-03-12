#!/bin/bash
# check if kob is installed
# Remove any old output.txt files  
#rm output.txt
# run the command
kob help > output.txt
# check the output of the command
# if ( cat output.txt | grep "known pattern") 
 echo " Success"
#  return 
 else 
  echo "Failed $0"
# check and remove
rm output.txt







