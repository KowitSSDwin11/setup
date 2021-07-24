#!/usr/bin/env bash

cd

source ~/.profile

echo "Updating"
sleep 5

sudo apt-get update && sudo apt-get upgrade 

echo "Installing the build packages"
sleep 5

sudo apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev git adb fastboot

echo "Updating"
sleep 5

sudo apt-get update && sudo apt-get upgrade

echo "Creating bin"
sleep 5

mkdir -p ~/bin

echo "Creating android/lineage"
sleep 5

mkdir -p ~/android/lineage

echo "Downloading the repo command"
sleep 5

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

echo "Installing the repo command"
sleep 5

chmod a+x ~/bin/repo

echo "updating"
sleep 5

source ~/.profile

echo "Set git email"
sleep 5

git config --global user.email "rushi@titan.com"

echo "Set git name"
sleep 5

git config --global user.name "rushi"

echo "Turning on caching to speed up build"
sleep 5

export USE_CCACHE=1

export CCACHE_EXEC=/usr/bin/ccache

source ~/.bashrc

source ~/.profile

echo "next"
sleep 5

ccache -M 50G

echo "next"
sleep 5

ccache -o compression=true

echo "Confirming"
sleep 5

cd ~/android/lineage

echo "Initializing the LineageOS source repository"
sleep 5

repo init -u https://github.com/LineageOS/android.git -b lineage-17.1

echo "Downloading the source code"
sleep 5

repo sync -j16

echo "Confirming"
sleep 5

cd ~/android/lineage

echo "Cloning device tree"
sleep 5

git clone https://github.com/RenanQueiroz/android_device_motorola_titan -b lineage-17.1 device/motorola/titan

echo "Cloning device kernel"
sleep 5

git clone https://github.com/RenanQueiroz/android_kernel_motorola_msm8226 -b lineage-17.0 kernel/motorola/msm8226

echo "Cloning device vendor"
sleep 5

git clone https://github.com/RenanQueiroz/proprietary_vendor_motorola -b lineage-16.0 vendor/motorola

echo "Cloning device common"
sleep 5

git clone https://github.com/MotoDevelopment/android_device_motorola_msm8226-common -b lineage-17.1 device/motorola/msm8226-common

echo "Preparing the device-specific code"
sleep 5

source build/envsetup.sh

echo "breakfast"
sleep 5

breakfast titan

echo "Croot"
sleep 5

croot
echo "Building"
sleep 5
brunch titan
