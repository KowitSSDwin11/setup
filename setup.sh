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
echo "Creating android"
mkdir -p ~/android
echo "setting up repo"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "Updating profile"
echo "# add Android SDK platform tools to path" >> ~/.profile
echo "if [ -d "$HOME/platform-tools" ] ; then" >> ~/.profile
echo "    PATH="$HOME/platform-tools:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile
echo "# set PATH so it includes user's private bin if it exists" >> ~/.profile
echo "if [ -d "$HOME/bin" ] ; then" >> ~/.profile
echo "    PATH="$HOME/bin:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile
echo "Updating bashrc"
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache" >> ~/.bashrc
echo "ccache -M 10G" >> ~/.bashrc
echo "export USE_NINJA=false" >> ~/.bashrc
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 10G
export USE_NINJA=false
echo "Updating environment"
cd ~/
sudo apt-get update && sudo apt-get upgrade -y
source ~/.bashrc
source ~/.profile
echo "Config git"
git config --global user.email "rushi@gmail.com"
git config --global user.name "rushi"
echo "done"
cd ~/
sudo apt-get update && sudo apt-get upgrade -y
free -h
df -h
