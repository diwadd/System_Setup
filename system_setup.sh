#!/bin/bash


# Making sure that root is running this script.
if [ $EUID -ne 0 ]; then
   echo "This script must be run as root." 1>&2
   exit 1
fi

echo "The script is being run by root."

# A function that will invoce the apt-get command.
# agf stands for apt-get function
function agf {
    apt-get --assume-yes install $1 
}

# List of packages to install
packageList=( build-essential \ 
              git \
              python3 \
              python3-dev \
              python3-pip \
              swig \
              gedit \
              vim
              terminator \
              openjdk-8-jdk \
              libcurl3-dev )


for p in "${packageList[@]}"
do
    agf $p
done


# A function that will invoce the pip3 command.
# p3f stands for pip3 function
function p3f {
    pip3 install -U $1
}

# List of python libraries

pythonLibraries=( matplotlib \
                  numpy \
                  scipy \
                  scikit-learn \
                  pandas )

for l in "${pythonLibraries[@]}"
do
    p3f $l
done



