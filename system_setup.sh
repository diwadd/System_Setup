#!/bin/bash


# Make sure only root can run our script
if [ $EUID -ne 0 ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "The script is being run by root."

# A function that will invoce the apt-get command.
# agf stands for apt-get function
function agf {
    apt-get --assume-yes install $1 
}


# List of packages to install
packageList=( git \
              python3 \
              python3-dev \
              python3-pip )


for p in "${packageList[@]}"
do
    agf $p
done
