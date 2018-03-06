#!/bin/bash

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
apt-get update -y
apt-get install terminator -y
apt-get install google-chrome-stable -y
apt-get install ubuntu-restricted-extras -y
apt-get install git -y


