#!/usr/bin/env bash

sudo apt update && sudo apt upgrade -y
sudo apt-get update && sudo apt-get upgrade -y
sudo apt -y install wget bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python jq seahorse-nautilus nautilus firefox openjdk-8-jdk libwxgtk3.0-dev libwxgtk3.0-gtk3-dev

wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg -i chrome-remote-desktop_current_amd64.deb 
sudo dpkg --configure -a
sudo apt --fix-broken install -y

mkdir rom

curl -sL $OUTFILE https://git.io/file-transfer | sh 
wget https://raw.githubusercontent.com/Sushrut1101/GoFile-Upload/master/upload.sh

wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~

git clone https://github.com/akhilnarang/scripts
cd scripts
./setup/android_build_env.sh

mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "# add Android SDK platform tools to path" >> ~/.profile
echo "if [ -d "$HOME/platform-tools" ] ; then" >> ~/.profile
echo "    PATH="$HOME/platform-tools:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile
echo "# set PATH so it includes user's private bin if it exists" >> ~/.profile
echo "if [ -d "$HOME/bin" ] ; then" >> ~/.profile
echo "    PATH="$HOME/bin:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile

sudo snap install notepad-plus-plus

git config --global user.email "rushiranpise17@gmail.com"
git config --global user.name "Rushi Ranpise"
git config --global color.ui true

sudo apt update && sudo apt upgrade -y
sudo apt-get update && sudo apt-get upgrade -y

source ~/.bashrc
source ~/.profile

cat /etc/os*
df -h
free -h
nproc
echo "done"
