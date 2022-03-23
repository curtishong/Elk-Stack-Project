#!/bin/bash


#Don't let root run this....
if [ $UID = 0 ]
then 
echo 'Dont run this script as root'
fi

# This will be my output file
output_file="$HOME/my_output.txt"

#Create ~/research if it doesnt exist.
if [ ! -d $HOME/research ]
then
mkdir $HOME/research
fi

# Remove ~/research/sys_info.txt if it exists.
if [ -d $HOME/research/sys_info.txt ]
then
rm $HOME/reseach/sys_info.txt
fi 

#Store current system IPv4 System
ipv4= $(hostname -I | awk -f' ' '{print $1}')

#Store all executables found in /home.
executables=$(find /home -type f -perm 777)


