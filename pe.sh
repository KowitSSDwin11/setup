#!/usr/bin/env bash

echo "CD"
cd
echo "Updating..."
sudo apt-get update && sudo apt-get upgrade -y
echo"Downloading platformtools"
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
echo "Unziping platformtools"
unzip platform-tools-latest-linux.zip -d ~
echo "Updating environment"
echo "# add Android SDK platform tools to path" >> ~/.profile
echo "if [ -d "$HOME/platform-tools" ] ; then" >> ~/.profile
echo "    PATH="$HOME/platform-tools:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile
echo "# set PATH so it includes user's private bin if it exists" >> ~/.profile
echo "if [ -d "$HOME/bin" ] ; then" >> ~/.profile
echo "    PATH="$HOME/bin:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile
source ~/.profile
echo "ccache -M 50G" >> ~/.bashrc
source ~/.bashrc
source ~/.profile
sudo apt install git
echo "CD"
cd ~/
echo "Downloading configuration script"
git clone https://github.com/akhilnarang/scripts
echi "CD"
cd scripts
echo "Running configuration script"
./setup/android_build_env.sh
echo "CD"
cd
echo "Creating bin"
mkdir -p ~/bin
echo "Creating android/pe"
mkdir -p ~/android/pe
echo "Downloading repo"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
echo "Installing repo"
chmod a+x ~/bin/repo
echo "Updating environment"
source ~/.profile
echo "Set git email"
git config --global user.email "you@example.com"
echo "Set git name"
git config --global user.name "Your Name"
echo "Updating..."
sudo apt-get update && sudo apt-get upgrade -y
echo "CD"
cd ~/android/pe
echo "Initializing the PE source repository"
repo init -u https://github.com/PixelExperience/manifest -b ten-plus
echo "CD"
cd ~/android/pe
echo "Downloading the source code"
repo sync -j$(nproc --all) -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo "CD"
cd ~/android/pe
echo "Cloning device tree"
git clone https://github.com/thedeadfish59/android_device_motorola_titan -b ten device/motorola/titan
echo "Cloning device kernel"
git clone https://github.com/thedeadfish59/android_kernel_motorola_msm8226 -b ten kernel/motorola/msm8226
echo "Cloning device vendor"
git clone https://github.com/thedeadfish59/proprietary_vendor_motorola -b ten vendor/motorola
echo "Cloning device common"
git clone https://github.com/thedeadfish59/android_device_motorola_msm8226-common -b ten device/motorola/msm8226-common
echo "Cloning qcom"
git clone https://github.com/thedeadfish59/android_system_qcom -b ten system/qcom
echo "Preparing the device-specific code"
source build/envsetup.sh
echo "Lunch"
lunch aosp_titan-userdebug
echo "ccache"
export USE_CCACHE=1
echo "ccache"
export CCACHE_EXEC=/usr/bin/ccache
echo "ccache"
ccache -M 50G
echo "ccache"
ccache -o compression=true
echo "Updating environment"
source ~/.bashrc
echo "Updating environment"
source ~/.profile
echo "Croot"
croot
echo "Building"
mka bacon -j$(nproc --all)
