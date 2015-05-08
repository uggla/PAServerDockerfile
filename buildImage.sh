#!/bin/bash

# Build PA Server Image

# Start from clean conf files
rm auth_papatcher.sh NodePAMaster_conf.json
git checkout auth_papatcher.sh NodePAMaster_conf.json

echo "Enter PA username :"
read user
echo

echo "Enter PA password :"
read password
echo

echo "Enter Server IP (default : 127.0.0.0) :"
read serveripaddress
echo

echo "Enter Server Name :"
read servername
echo

echo "Enter Server Region :"
read serverregion
echo

echo "List on PAstats (y/n) :"
read serverlistonpastats
echo

# Check inputs
if [ -z "$user" ]; then echo "User invalid";exit 1;fi
if [ -z "$password" ]; then echo "Password invalid";exit 1;fi
if [ -z "$serveripaddress" ]; then serveripaddress="127.0.0.1";fi
if [ -z "$servername" ]; then echo "Server name invalid";exit 1;fi
if [ -z "$serverregion" ]; then echo "Server region invalid";exit 1;fi
if [ "$serverlistonpastats" == "y" ] || [ "$serverlistonpastats" == "n" ]
	then echo Config parameter ok
else 
	echo "List on PAstats invalid please choose \"y\" or \"n\"";exit 1
fi
if [ "$serverlistonpastats" == "y" ]; then serverlistonpastats="true";fi
if [ "$serverlistonpastats" == "n" ]; then serverlistonpastats="false";fi

# Update conf files
sed -i "s/pauser_to_replace/$user/" auth_papatcher.sh
sed -i "s/papassword_to_replace/$password/" auth_papatcher.sh


sed -i "s/server_name_to_replace/$servername/" NodePAMaster_conf.json
sed -i "s/region_to_replace/$serverregion/" NodePAMaster_conf.json
sed -i "/serverip/ s/127\.0\.0\.1/$serveripaddress/" NodePAMaster_conf.json
sed -i "/listonpastats/ s/true/$serverlistonpastats/" NodePAMaster_conf.json



#sudo docker build --rm=true .
sudo docker build .
