#!/bin/bash

if grep -i ubuntu /etc/os-release 1> /dev/null
then 

	# ------ OS = Ubuntu -----------
	echo "-------------- OS = Ubuntu -------------------"
	sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
	sudo sed -i -e 's/us.archive.ubuntu.com/archive.ubuntu.com/g' /etc/apt/sources.list
	sudo apt-get update -y
	sudo apt-get install vim -y
	sudo apt-get install curl -y
	sudo apt-get install terminator -y
	sudo apt-get install google-chrome-stable -y
	sudo apt-get install ubuntu-restricted-extras -y
	sudo apt-get install git -y

	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt-get update
	apt-cache policy docker-ce
	sudo apt-get install -y docker-ce
	sudo systemctl status docker

	sudo usermod -aG docker ${USER}

elif grep -i "Red Hat" /etc/redhat-release 1> /dev/null
then
	# -------- OS = Red Hat --------
	echo "-------------- OS = RedHat -------------------"
	sudo hostnamectl set-hostname $1
#	sudo hostnamectl set-hostname "gbouchaRHEL1"
	sudo subscription-manager register --username gboucha --password Technet12 --auto-attach
	sudo yum update -y
	sudo yum install git -y
	sudo yum install curl -y


else 

	#------ OS = Centos ---------
	echo "-------------- OS = Centos -------------------"
	sudo yum update -y
	sudo yum install vim -y
	sudo yum install curl -y
	sudo yum install git -y
	curl -fsSL https://get.docker.com/ | sh
	sudo systemctl start docker
	sudo systemctl status docker
	sudo systemctl enable docker
	sudo usermod -aG docker $(whoami)
	
	
fi
