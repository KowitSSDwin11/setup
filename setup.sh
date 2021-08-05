#!/usr/bin/env bash
echo "cd"
cd ~/
echo "Updating environment"
sudo apt-get update && sudo apt-get upgrade -y
echo "Installing the build packages"
sudo apt-get install -y mc bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
echo "Downloading platformtools"
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
echo "Unziping platformtools"
unzip platform-tools-latest-linux.zip -d ~
echo "Running akhil's script"
sudo apt install -y git
cd ~/
git clone https://github.com/akhilnarang/scripts
cd scripts
./setup/android_build_env.sh
cd ~/
echo "Creating bin"
mkdir -p ~/bin
echo "setting up repo"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "Config git"
git config --global user.email "rushi4tg@hottempmail.com"
git config --global user.name "rushi"
git config --global color.ui true
echo "Updating profile"
echo "# add Android SDK platform tools to path" >> ~/.profile
echo "if [ -d "$HOME/platform-tools" ] ; then" >> ~/.profile
echo "    PATH="$HOME/platform-tools:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile
echo "# set PATH so it includes user's private bin if it exists" >> ~/.profile
echo "if [ -d "$HOME/bin" ] ; then" >> ~/.profile
echo "    PATH="$HOME/bin:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile
echo "Updating environment"
sudo apt install -y python
sudo apt-get update && sudo apt-get upgrade -y
source ~/.bashrc
source ~/.profile
cat /etc/os*
df -h
free -h
nproc
echo "done"
