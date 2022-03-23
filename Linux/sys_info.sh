#!/bin/bash

#A title and today's date
echo -e 'Hello World.\n Today is 1/20/2022 \n'
echo -e 'The '$USER' is my username. \n'
$myip=hostname -l | awk '{print $1}' 
echo -e 'The ipaddress is '${myip}' . \n'
echo -e 'The '$HOSTNAME' is my hostname. \n'

echo -e 'The DNS info is  
