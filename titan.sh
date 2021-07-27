#!/usr/bin/env bash

echo "CD"
cd
echo "Updating..."
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev git adb fastboot
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
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=$(command -v ccache)" >> ~/.bashrc
echo "ccache -M 50G" >> ~/.bashrc
echo "export USE_NINJA=false" >> ~/.bashrc
source ~/.bashrc
source ~/.profile
echo "ccache"
export USE_CCACHE=1
echo "ccache"
export CCACHE_EXEC=$(command -v ccache)
echo "ccache"
ccache -M 50G
export USE_NINJA=false
echo "Updating environment"
source ~/.bashrc
echo "Updating environment"
source ~/.profile
sudo apt install git
echo "CD"
cd ~/
echo "Downloading configuration script"
git clone https://github.com/akhilnarang/scripts
echo "CD"
cd scripts
echo "Running configuration script"
./setup/android_build_env.sh
echo "CD"
cd
echo "Creating bin"
mkdir -p ~/bin
echo "Creating android/lineage"
mkdir -p ~/android/lineage
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
cd ~/android/lineage
echo "Initializing the PE source repository"
repo init -u https://github.com/LineageOS/android.git -b lineage-17.1
echo "CD"
cd ~/android/lineage
echo "Downloading the source code"
repo sync -j$(nproc --all) -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo "CD"
cd ~/android/lineage
echo "Cloning device tree"
git clone https://github.com/RenanQueiroz/android_device_motorola_titan -b lineage-17.1 device/motorola/titan
echo "Cloning device kernel"
git clone https://github.com/RenanQueiroz/android_kernel_motorola_msm8226 -b lineage-17.0 kernel/motorola/msm8226
echo "Cloning device vendor"
git clone https://github.com/RenanQueiroz/proprietary_vendor_motorola -b lineage-16.0 vendor/motorola
echo "Cloning device common"
git clone https://github.com/MotoDevelopment/android_device_motorola_msm8226-common -b lineage-17.1 device/motorola/msm8226-common
echo "Cloning qcom"
git clone https://github.com/LineageOS/android_system_qcom -b lineage-17.1 system/qcom
echo "Preparing the device-specific code"
source build/envsetup.sh
echo "breakfast"
breakfast titan
echo "Croot"
croot
echo "Building"
brunch titan -j16
