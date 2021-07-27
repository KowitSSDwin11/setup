#!/usr/bin/env bash

sudo apt-get update && sudo apt-get upgrade -y
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d
sudo apt install git
git clone https://github.com/akhilnarang/scripts
cd scripts
./setup/android_build_env.sh
cd -
echo "# add Android SDK platform tools to path" >> ~/.profile
echo "if [ -d "gitpod/workspace/titan/platform-tools" ] ; then" >> ~/.profile
echo "    PATH="gitpod/workspace/titan/platform-tools:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile
echo "# set PATH so it includes user's private bin if it exists" >> ~/.profile
echo "if [ -d "gitpod/workspace/titan/bin" ] ; then" >> ~/.profile
echo "    PATH="gitpod/workspace/titan/bin:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile
source ~/.profile
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=$(command -v ccache)" >> ~/.bashrc
echo "ccache -M 50G" >> ~/.bashrc
echo "export USE_NINJA=false" >> ~/.bashrc
source ~/.bashrc
source ~/.profile
export USE_CCACHE=1
export CCACHE_EXEC=$(command -v ccache)
ccache -M 50G
export USE_NINJA=false
source ~/.bashrc
source ~/.profile
mkdir -p bin
mkdir -p android/pe
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x bin/repo
source ~/.profile
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
sudo apt-get update && sudo apt-get upgrade -y
cd android/pe
repo init -u https://github.com/PixelExperience/manifest -b ten-plus
cd android/pe
repo sync -j$(nproc --all) -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd android/pe
git clone https://github.com/thedeadfish59/android_device_motorola_titan -b ten device/motorola/titan
git clone https://github.com/thedeadfish59/android_kernel_motorola_msm8226 -b ten kernel/motorola/msm8226
git clone https://github.com/thedeadfish59/proprietary_vendor_motorola -b ten vendor/motorola
git clone https://github.com/thedeadfish59/android_device_motorola_msm8226-common -b ten device/motorola/msm8226-common
git clone https://github.com/thedeadfish59/android_system_qcom -b ten system/qcom
source build/envsetup.sh
lunch aosp_titan-userdebug
croot
mka bacon -j$(nproc --all)
