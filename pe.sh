#!/usr/bin/env bash

echo "Step 1"
cd
echo "Step 2"
sudo -s
echo "Step 3"
sudo apt-get update && sudo apt-get upgrade -y
echo"Step 4"
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
echo "Step 5"
unzip platform-tools-latest-linux.zip -d ~
echo "Step 6"
sudo apt install git
echo "Step 7"
cd ~/
echo "Step 8"
git clone https://github.com/akhilnarang/scripts
echi "Step 9"
cd scripts
echo "Step 10"
./setup/android_build_env.sh
echo "Step 11"
cd
echo "Step 12"
mkdir -p ~/bin
echo "Step 13"
mkdir -p ~/android/pe
echo "Step 14"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
echo "Step 15"
chmod a+x ~/bin/repo
echo "Step 16"
source ~/.profile
echo "Step 17"
git config --global user.email "you@example.com"
echo "Step 18"
git config --global user.name "Your Name"
echo "Step 19"
sudo apt-get update && sudo apt-get upgrade -y
echo "Step 20"
cd ~/android/pe
echo "Step 21"
repo init -u https://github.com/PixelExperience/manifest -b ten-plus
echo "Step 22"
cd ~/android/pe
echo "Step 23"
repo sync -j$(nproc --all) -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo "Step 24"
cd ~/android/pe
echo "Step 25"
git clone https://github.com/thedeadfish59/android_device_motorola_titan -b ten device/motorola/titan
echo "Step 26"
git clone https://github.com/thedeadfish59/android_kernel_motorola_msm8226 -b ten kernel/motorola/msm8226
echo "Step 27"
git clone https://github.com/thedeadfish59/proprietary_vendor_motorola -b ten vendor/motorola
echo "Step 28"
git clone https://github.com/thedeadfish59/android_device_motorola_msm8226-common -b ten device/motorola/msm8226-common
echo "Step 29"
git clone https://github.com/thedeadfish59/android_system_qcom -b ten system/qcom
echo "Step 30"
source build/envsetup.sh
echo "Step 31"
lunch aosp_titan-userdebug
echo "Step 32"
export USE_CCACHE=1
echo "Step 33"
export CCACHE_EXEC=/usr/bin/ccache
echo "Step 34"
ccache -M 50G
echo "Step 35"
ccache -o compression=true
echo "Step 36"
source ~/.bashrc
echo "Step 37"
source ~/.profile
echo "Step 38"
croot
echo "Step 39"
mka bacon -j$(nproc --all)
echo "Step 40"
cd $OUT
