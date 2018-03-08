#!/bin/bash

if grep -i ubuntu /etc/os-release 1> /dev/null
then echo OS=ubuntu
else echo OS=centos
fi
 

